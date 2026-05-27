import { Octokit } from "@octokit/rest";
import { readFileSync, writeFileSync } from "node:fs";

const USER = process.env.GITHUB_USER ?? "ozpool";
const TOKEN = process.env.GITHUB_TOKEN;
const README = "README.md";
const MAX_ORGS = 10;
const MAX_ROWS = 10;
const SEARCH_PAGE_CAP = 10;

const octokit = new Octokit(TOKEN ? { auth: TOKEN } : {});

type PR = {
  number: number;
  title: string;
  state: "open" | "closed";
  merged: boolean;
  url: string;
  repoFullName: string;
};

type Issue = {
  number: number;
  title: string;
  url: string;
  repoFullName: string;
};

async function searchAll(q: string) {
  const out: Awaited<
    ReturnType<typeof octokit.search.issuesAndPullRequests>
  >["data"]["items"] = [];
  for (let page = 1; page <= SEARCH_PAGE_CAP; page += 1) {
    const { data } = await octokit.search.issuesAndPullRequests({
      q,
      per_page: 100,
      page,
    });
    out.push(...data.items);
    if (data.items.length < 100 || out.length >= data.total_count) break;
  }
  return out;
}

function repoFromUrl(url: string) {
  return url.replace("https://api.github.com/repos/", "");
}

function escapeTitle(s: string) {
  return s.replace(/\|/g, "\\|").replace(/\r?\n/g, " ").trim();
}

function groupByRepo<T extends { repoFullName: string }>(rows: T[]) {
  const m = new Map<string, T[]>();
  for (const r of rows) {
    const list = m.get(r.repoFullName) ?? [];
    list.push(r);
    m.set(r.repoFullName, list);
  }
  return [...m.entries()].sort((a, b) => b[1].length - a[1].length);
}

function renderPRsBlock(prs: PR[]): string {
  if (prs.length === 0) return "_no contributions indexed yet._";
  const grouped = groupByRepo(prs).slice(0, MAX_ORGS);
  return grouped
    .map(([repo, items]) => {
      const allLink = `https://github.com/${repo}/pulls?q=author%3A${USER}+is%3Apr`;
      const rows = items
        .slice(0, MAX_ROWS)
        .map((p) => {
          const status = p.merged
            ? "`merged`"
            : p.state === "open"
              ? "`open`"
              : "`closed`";
          return `- [\`#${p.number}\`](${p.url}) — ${escapeTitle(p.title)} · ${status}`;
        })
        .join("\n");
      const word = items.length === 1 ? "PR" : "PRs";
      return `<details>
<summary><b><a href="https://github.com/${repo}">${repo}</a></b> · ${items.length} ${word} · <a href="${allLink}">all →</a></summary>

${rows}

</details>`;
    })
    .join("\n\n");
}

function renderIssuesBlock(issues: Issue[], stateLabel: string): string {
  if (issues.length === 0) return `_no ${stateLabel} issues filed._`;
  const grouped = groupByRepo(issues).slice(0, MAX_ORGS);
  return grouped
    .map(([repo, items]) => {
      const rows = items
        .slice(0, MAX_ROWS)
        .map((i) => `- [\`#${i.number}\`](${i.url}) — ${escapeTitle(i.title)}`)
        .join("\n");
      const word = items.length === 1 ? "issue" : "issues";
      return `<details>
<summary><b><a href="https://github.com/${repo}">${repo}</a></b> · ${items.length} ${word}</summary>

${rows}

</details>`;
    })
    .join("\n\n");
}

function replaceBlock(md: string, name: string, body: string): string {
  const start = `<!-- START:${name} -->`;
  const end = `<!-- END:${name} -->`;
  const re = new RegExp(`${start}[\\s\\S]*?${end}`);
  if (!re.test(md)) throw new Error(`block ${name} missing from README`);
  return md.replace(re, `${start}\n${body}\n${end}`);
}

async function main() {
  const [prRaw, openRaw, closedRaw] = await Promise.all([
    searchAll(`is:pr author:${USER} -user:${USER}`),
    searchAll(`is:issue is:open author:${USER} -user:${USER}`),
    searchAll(`is:issue is:closed author:${USER} -user:${USER}`),
  ]);

  const prs: PR[] = prRaw.map((i) => ({
    number: i.number,
    title: i.title,
    state: i.state as "open" | "closed",
    merged: !!i.pull_request?.merged_at,
    url: i.html_url,
    repoFullName: repoFromUrl(i.repository_url),
  }));
  const open: Issue[] = openRaw.map((i) => ({
    number: i.number,
    title: i.title,
    url: i.html_url,
    repoFullName: repoFromUrl(i.repository_url),
  }));
  const closed: Issue[] = closedRaw.map((i) => ({
    number: i.number,
    title: i.title,
    url: i.html_url,
    repoFullName: repoFromUrl(i.repository_url),
  }));

  let md = readFileSync(README, "utf8");
  md = replaceBlock(md, "ecosystem", renderPRsBlock(prs));
  md = replaceBlock(md, "issues-open", renderIssuesBlock(open, "open"));
  md = replaceBlock(md, "issues-closed", renderIssuesBlock(closed, "closed"));
  writeFileSync(README, md);
}

main().catch((e) => {
  console.error(e);
  process.exit(1);
});
