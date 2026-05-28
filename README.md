<div align="center">

<a href="https://github.com/ozpool">
  <img src="https://readme-typing-svg.demolab.com/?lines=ozpool+%C2%B7+blockchain+%26+smart-contract+engineer;five+years+writing+code+that+holds+under+load;defi+%C2%B7+nfts+%C2%B7+cross-chain+%C2%B7+smart-contract+infra&font=Fira+Code&center=true&width=720&height=48&color=06B6D4&vCenter=true&size=20&pause=1200" alt="ozpool" />
</a>

</div>

---

## 🌱 github activity

<sub>contribution heatmap — last 365 days. served by
[`ghchart.rshah.org`](https://github.com/2016rshah/githubchart-api),
tinted to match the cyan accents.</sub>

<div align="center">

[![ozpool contribution graph](https://ghchart.rshah.org/06B6D4/ozpool)](https://github.com/ozpool)

</div>

---

## 🪞 about

I write contracts and the off-chain plumbing that keeps them honest. Five years
across DeFi lending, NFT infrastructure, and cross-chain messaging — Solidity
when the chain is the source of truth, Rust and Go when it isn't.

The code I ship runs under adversarial conditions, so I optimise for the
qualities that matter there: events on every state change, return values
checked, threat model written before the first line of logic.

Lately reading more on MEV-aware design, the gap between Chainlink and Pyth
oracle assumptions, and what intent-based execution actually changes about
contract architecture.

---

## 🧭 now

```text
┌─ now ────────────────────────────────────────────────┐
│  🛠   shipping     defi · cross-chain · audits        │
│  📬   available    yes — solidity audits + contracts  │
│  🌊   signature    pool runs deep                     │
│  ⚡   response     ~24h                               │
└──────────────────────────────────────────────────────┘
```

---

## ⚡ depth chart

> *depth = available liquidity of experience.*

```text
solidity     ████████████   5y
foundry      ███████████   ~5y
typescript   █████████      4y
javascript   █████████      4y
rust         ████████       3y
python       ███████        3y
layerzero    ██████         3y
go           ████           2y
vyper        ████           2y
move         ██             1y
```

---

## 🛠 what i'm building

<sub>own public repos — top by stars, auto-refreshed by `scripts/update.sh`.</sub>

<!--
  Auto-refreshed twice daily by .github/workflows/update-readme.yml.
  Do not edit content between START:building and END:building by hand.
-->

<!-- START:building -->
<details>
<summary><b><a href="https://github.com/ozpool/prism">prism</a></b> — Liquidity Management Protocol on Uniswap V4</summary>

PRISM wraps a Uniswap V4 pool in a vault that refracts LP capital across a configurable spectrum of tick-range positions. Where V3-era LM (Gamma, Arrakis) smoothed day-to-day LP work but remained bottlenecked by centralized advisors, PRISM uses V4's hook primitive and EIP-1153 flash accounting to push the entire management loop on-chain:

</details>

<details>
<summary><b><a href="https://github.com/ozpool/Perplex">Perplex</a></b> — Perplex — dYdX-class decentralised perpetuals exchange. Off-chain Rust matching engine + on-chain Solidity settlement on Arbitrum. Pyth oracles, 8h funding, liquidation + ADL backstop, EIP-712 signed batch settlement.</summary>

A dYdX-class decentralised perpetual-futures exchange. Orderbook-matched. USDC-collateralised. Self-custodial. Built for Arbitrum.

topics: `arbitrum` `axum` `defi` `dex` `ethereum` `foundry` `perpetuals` `pyth` `rust` `solidity`

</details>

<details>
<summary><b><a href="https://github.com/ozpool/Eigenvex">Eigenvex</a></b> — Perpetual futures protocol on Solana — hybrid orderbook + vAMM, cross-margin, DAO-curated listings</summary>

Perpetual futures protocol on Solana — hybrid orderbook + vAMM, cross-margin, DAO-curated listings

</details>

<details>
<summary><b><a href="https://github.com/ozpool/atlas-lend">atlas-lend</a></b> — _no description_</summary>

All contributions must follow the repository's issue and pull request templates.

</details>

<details>
<summary><b><a href="https://github.com/ozpool/Solidity0.1">Solidity0.1</a></b> — _no description_</summary>

_no description_

</details>

<details>
<summary><b><a href="https://github.com/ozpool/aave-solidity">aave-solidity</a></b> — _no description_</summary>

_no description_

</details>
<!-- END:building -->

---

## 🧰 stack

<sub>flat list, no badge soup. depth in `depth chart` above.</sub>

```text
🧠  languages       solidity · rust · go · typescript · python · move · vyper · js
⚒️  contracts       foundry · hardhat · openzeppelin · remix · anvil · safe · tenderly · oz-defender
🔗  web3 libs       ethers.js · viem · wagmi · web3.js · web3.py · metamask-sdk
🧱  standards       erc-20 · erc-721 · erc-1155 · erc-4626 · erc-2981 · erc-4337 · eip-2771 · eip-7702
🌉  cross-chain     layerzero · wormhole · axelar · chainlink-ccip · hyperlane · fx-portal
⛓️  chains          ethereum · arbitrum · optimism · base · polygon · zksync · bnb · solana
📊  oracles         chainlink · pyth · redstone · api3
🛡️  security        slither · echidna · mythril · foundry-invariants · halmos · certora · mythx
📡  data            the-graph · goldsky · subquery · ponder · postgres · redis
☁️  infra           docker · k8s · aws · gcp · prometheus · grafana · github-actions
```

---

## 📐 invariants

- 📣 every state change emits an event
- 🔁 every external call's return value is checked
- 🧭 threat model is written before implementation, not after
- 🧮 no `unchecked` block without a comment proving the math
- 🔐 upgradability is a feature, not a default — `UUPS` only where it earns its rent

---

## 🛡️ security work

Slither + Foundry invariants + a manual pass against an explicit threat model.
Reentrancy, oracle manipulation, access control, arithmetic edges.

- 🧪 solidity audits and pre-launch threat modelling
- 🌉 bridge / cross-chain message-integrity reviews
- 📏 invariant-suite design for new protocols

---

## 🌊 outflow

<sub>open-source pull requests across other repos — grouped by repo, capped at top
10 by volume. Auto-refreshed by `scripts/update.sh`.</sub>

<!--
  Auto-refreshed twice daily by .github/workflows/update-readme.yml.
  Do not edit content between START:outflow and END:outflow by hand.
-->

<!-- START:outflow -->
<details>
<summary><b><a href="https://github.com/Soju06/codex-lb">Soju06/codex-lb</a></b> · 24 PRs · <a href="https://github.com/Soju06/codex-lb/pulls?q=author%3Aozpool+is%3Apr">all →</a></summary>

- [`#829`](https://github.com/Soju06/codex-lb/pull/829) — feat(accounts): surface email-duplicate pairs in /api/accounts · `open`
- [`#828`](https://github.com/Soju06/codex-lb/pull/828) — fix(sticky-sessions): chunk delete_entries to avoid sqlite bind overflow · `open`
- [`#812`](https://github.com/Soju06/codex-lb/pull/812) — test(api-keys): add ApiKeyTable component tests · `merged`
- [`#811`](https://github.com/Soju06/codex-lb/pull/811) — test(settings): add ImportSettings component tests · `merged`
- [`#799`](https://github.com/Soju06/codex-lb/pull/799) — fix(accounts): reuse existing row on reauth for same ChatGPT identity (closes #788) · `open`
- [`#798`](https://github.com/Soju06/codex-lb/pull/798) — docs(readme): lowercase codex provider name to match Codex 2026-05-23 update · `merged`
- [`#744`](https://github.com/Soju06/codex-lb/pull/744) — fix(codex_version): fall back to npm registry when GitHub is rate-limited · `merged`
- [`#743`](https://github.com/Soju06/codex-lb/pull/743) — chore(openspec): mark add-v1-api-key-usage tasks complete · `merged`
- [`#721`](https://github.com/Soju06/codex-lb/pull/721) — fix(db): merge api_key_codex_model and sqlite_recovery alembic heads · `closed`
- [`#720`](https://github.com/Soju06/codex-lb/pull/720) — fix(ci): unblock main — replace removed lucide-react Github icon + merge alembic heads · `closed`

</details>

<details>
<summary><b><a href="https://github.com/solana-foundation/solana-go">solana-foundation/solana-go</a></b> · 15 PRs · <a href="https://github.com/solana-foundation/solana-go/pulls?q=author%3Aozpool+is%3Apr">all →</a></summary>

- [`#447`](https://github.com/solana-foundation/solana-go/pull/447) — fix(rpc): default simulateTransaction Accounts.Encoding to base64 (closes #446) · `open`
- [`#445`](https://github.com/solana-foundation/solana-go/pull/445) — feat(address-lookup-table): one-call resolve for message lookups (closes #262) · `open`
- [`#442`](https://github.com/solana-foundation/solana-go/pull/442) — feat(rpc): forward MinContextSlot in getBalance / getLatestBlockhash / getSlot / getTokenAccountBalance · `open`
- [`#441`](https://github.com/solana-foundation/solana-go/pull/441) — fix(message): surface typed `ErrAddressTablesNotSet` from AccountMetaList (closes #280) · `open`
- [`#440`](https://github.com/solana-foundation/solana-go/pull/440) — fix(token,token-2022): Build() sets Impl to *T, matching DecodeInstruction (closes #222) · `open`
- [`#439`](https://github.com/solana-foundation/solana-go/pull/439) — fix(token,token-2022): per-instruction ProgramID override (closes #254) · `open`
- [`#436`](https://github.com/solana-foundation/solana-go/pull/436) — feat(rpc): add NewWithCommitment / NewWithTimeout / NewWithTimeoutAndCommitment (#414) · `merged`
- [`#434`](https://github.com/solana-foundation/solana-go/pull/434) — feat(ws): support dataSlice in ProgramSubscribe · `merged`
- [`#433`](https://github.com/solana-foundation/solana-go/pull/433) — feat(ws): support dataSlice in AccountSubscribe · `merged`
- [`#432`](https://github.com/solana-foundation/solana-go/pull/432) — feat(ws): support enableReceivedNotification in SignatureSubscribe · `merged`

</details>

<details>
<summary><b><a href="https://github.com/cosmos/cosmos-sdk">cosmos/cosmos-sdk</a></b> · 11 PRs · <a href="https://github.com/cosmos/cosmos-sdk/pulls?q=author%3Aozpool+is%3Apr">all →</a></summary>

- [`#26453`](https://github.com/cosmos/cosmos-sdk/pull/26453) — test(baseapp): pin gRPC Query / FinalizeBlock concurrency safety · `merged`
- [`#26452`](https://github.com/cosmos/cosmos-sdk/pull/26452) — feat(baseapp): emit gen-tx events on finalize-state EventManager · `closed`
- [`#26427`](https://github.com/cosmos/cosmos-sdk/pull/26427) — fix(store/cachemulti): isolate traceContext map across branched stores · `merged`
- [`#26426`](https://github.com/cosmos/cosmos-sdk/pull/26426) — feat(x/bank): add ValidateBounds for denom-metadata size caps · `closed`
- [`#26423`](https://github.com/cosmos/cosmos-sdk/pull/26423) — fix(x/upgrade/plan): accept Windows .exe daemon in archive layouts · `closed`
- [`#26422`](https://github.com/cosmos/cosmos-sdk/pull/26422) — fix(x/auth/tx): propagate signing options from codec to NewTxConfig · `merged`
- [`#26415`](https://github.com/cosmos/cosmos-sdk/pull/26415) — perf(x/bank)!: skip HasAccount probe when recipient already has a balance · `open`
- [`#26414`](https://github.com/cosmos/cosmos-sdk/pull/26414) — fix(cosmovisor): switch to staged upgrade binary on startup · `open`
- [`#26399`](https://github.com/cosmos/cosmos-sdk/pull/26399) — fix(x/auth/tx)!: reject deprecated Pagination in GetTxsEvent · `open`
- [`#26362`](https://github.com/cosmos/cosmos-sdk/pull/26362) — docs(swagger): regenerate Swagger API spec to match current protos · `merged`

</details>

<details>
<summary><b><a href="https://github.com/ethereum/go-ethereum">ethereum/go-ethereum</a></b> · 10 PRs · <a href="https://github.com/ethereum/go-ethereum/pulls?q=author%3Aozpool+is%3Apr">all →</a></summary>

- [`#34981`](https://github.com/ethereum/go-ethereum/pull/34981) — go.mod: bump golang.org/x/net to v0.53.0 to fix GO-2026-4918 · `open`
- [`#34980`](https://github.com/ethereum/go-ethereum/pull/34980) — p2p/nat: bump pion/stun to v3 to pull in fixed pion/dtls · `merged`
- [`#34971`](https://github.com/ethereum/go-ethereum/pull/34971) — rpc: count error responses against batch response size limit · `closed`
- [`#34970`](https://github.com/ethereum/go-ethereum/pull/34970) — core/txpool/blobpool: preserve limbo entry on update store failure · `open`
- [`#34968`](https://github.com/ethereum/go-ethereum/pull/34968) — node: match vhost allowlist case-insensitively · `closed`
- [`#34959`](https://github.com/ethereum/go-ethereum/pull/34959) — core/state/snapshot: make diskLayer.stopGeneration idempotent · `closed`
- [`#34958`](https://github.com/ethereum/go-ethereum/pull/34958) — cmd/geth: report disk space cleared on prune-history completion · `open`
- [`#34928`](https://github.com/ethereum/go-ethereum/pull/34928) — rpc: accept Windows reset error in websocket read limit test · `open`
- [`#34855`](https://github.com/ethereum/go-ethereum/pull/34855) — internal/ethapi, eth, eth/catalyst: gate eth_syncing on CL handshake · `open`
- [`#34854`](https://github.com/ethereum/go-ethereum/pull/34854) — eth/protocols/snap: validate trie node path length · `open`

</details>

<details>
<summary><b><a href="https://github.com/smartcontractkit/chainlink">smartcontractkit/chainlink</a></b> · 9 PRs · <a href="https://github.com/smartcontractkit/chainlink/pulls?q=author%3Aozpool+is%3Apr">all →</a></summary>

- [`#22460`](https://github.com/smartcontractkit/chainlink/pull/22460) — fix(utils): accept json.Number in ToDecimal · `open`
- [`#22459`](https://github.com/smartcontractkit/chainlink/pull/22459) — fix(chainlink): deterministic ordering for /nodes pagination · `open`
- [`#22428`](https://github.com/smartcontractkit/chainlink/pull/22428) — fix(tools/benchmark): drop unnecessary $ on arithmetic variables (SC2004) · `open`
- [`#22427`](https://github.com/smartcontractkit/chainlink/pull/22427) — fix(cmd): enforce TLS 1.2 minimum in shell HTTP client · `open`
- [`#22405`](https://github.com/smartcontractkit/chainlink/pull/22405) — fix(deployment/solutils): validate archive paths to prevent Zip Slip · `open`
- [`#22350`](https://github.com/smartcontractkit/chainlink/pull/22350) — fix(scripts): make setup_testdb.sh runnable on Linux · `open`
- [`#22267`](https://github.com/smartcontractkit/chainlink/pull/22267) — docs: drop deprecated parity-ethereum / openethereum references · `open`
- [`#22266`](https://github.com/smartcontractkit/chainlink/pull/22266) — fix(bridges): treat bridge names case-insensitively on read and on create · `open`
- [`#22265`](https://github.com/smartcontractkit/chainlink/pull/22265) — fix(pipeline): reject partially-consumed input in JSONWithVarExprs · `open`

</details>
<!-- END:outflow -->

---

## 📌 issues filed

<sub>issues opened by `ozpool` in other repos, split open / closed. Auto-refreshed
by `scripts/update.sh`.</sub>

### 🟢 open

<!-- START:issues-open -->
<details>
<summary><b><a href="https://github.com/solana-foundation/solana-go">solana-foundation/solana-go</a></b> · 1 issue</summary>

- [`#446`](https://github.com/solana-foundation/solana-go/issues/446) — simulateTransaction: SimulateTransactionAccountsOpts.Encoding defaults to empty string, validator rejects

</details>
<!-- END:issues-open -->

### 🟣 closed

<!-- START:issues-closed -->
_no closed issues filed._
<!-- END:issues-closed -->

---

<div align="center">

<p>
  <img src="https://komarev.com/ghpvc/?username=ozpool&style=for-the-badge&color=06B6D4&label=PROFILE+VIEWS" alt="views" />
  <img src="https://img.shields.io/github/followers/ozpool?style=for-the-badge&color=14B8A6&labelColor=0F172A" alt="followers" />
  <img src="https://img.shields.io/badge/open_to-audits_%26_contracts-22D3EE?style=for-the-badge&labelColor=0F172A" alt="open to" />
</p>

</div>

<p align="center"><sub><i>🌊 deep pool, slow drain.</i></sub></p>
