<div align="center">

# Jitender Singh

### Senior Software Developer

*High-throughput distributed systems, where the backend meets AI agents and on-chain settlement.*

`Go` · `Rust` · `TypeScript` · `Solidity` · 7+ years · fintech · DeFi · AI engineering

[![Open to work](https://img.shields.io/badge/open_to-roles_%26_contracts-06B6D4?style=flat-square&labelColor=0F172A)](https://github.com/ozpool)
[![Response](https://img.shields.io/badge/response-~24h-14B8A6?style=flat-square&labelColor=0F172A)](https://github.com/ozpool)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-0A66C2?style=flat-square&logo=linkedin&logoColor=white)](https://linkedin.com/in/jitender-singh-94a342381/)

</div>

---

Senior software developer with 7+ years building high-throughput, low-latency distributed systems in **Go, Rust, and Node.js/TypeScript**, on a strong foundation of data structures, algorithms, and system design. I design event-driven microservices backed by PostgreSQL and Redis, focused on data consistency, fault tolerance, and horizontal scaling, and own the full delivery path: REST/gRPC APIs, containerized services on Docker and Kubernetes, CI/CD, and Prometheus/Grafana observability.

Lately my work sits at the intersection of three things:

```text
        distributed backend  ──┐
                                ├──►  systems that turn intent into action,
              AI / LLM agents  ─┤      reliably, under adversarial load
                                │
        blockchain / on-chain  ─┘
```

I build **AI-powered backends** (LLM integrations, agentic workflows, and RAG pipelines using the Claude API, Model Context Protocol, and LangChain with vector databases) and **blockchain/DeFi infrastructure** handling tens of thousands of daily transactions across distributed networks. I optimise for what survives production: consistency over duplicate intents, fault isolation per session, an event on every state change, and a threat model written before the first line of logic.

<br/>

## ⬡ What I Do

<table>
<tr>
<td width="33%" valign="top">

### 🛠 Distributed Backend
Event-driven microservices in Go, Rust, and Node. gRPC/REST/WebSocket APIs, message queues, idempotency, nonce sequencing, horizontal scaling, and fault tolerance. PostgreSQL + Redis persistence tuned for consistency under load.

</td>
<td width="33%" valign="top">

### 🤖 AI / LLM Engineering
LLM integrations, agentic systems, and RAG pipelines. Claude API + Anthropic SDK, MCP, LangChain, and vector DBs (Pinecone). ERC-4337 session keys that let AI agents execute on-chain within user-defined limits.

</td>
<td width="33%" valign="top">

### ⛓ Blockchain / DeFi
Solidity + Rust/Anchor across EVM and Solana. Lending protocols, perp DEXs, AMMs, account abstraction, cross-chain messaging. Audited with Slither/MythX; tens of thousands of daily txns.

</td>
</tr>
</table>

<br/>

## ⬡ How I Build

> Principles for systems that have to stay correct under load.

- **Every state change emits an event**, and every external call's return value is checked
- **Design for failure first**, fault isolation per session, retries, and graceful degradation before the happy path
- **Exactly-once execution**, idempotency keys and nonce sequencing so retried or duplicate intents never double-execute
- **Observability is not optional**, structured logging, metrics, and tracing shipped with the feature, not bolted on after
- **Threat model before implementation**, the failure cases get written down before the first line of logic

<br/>

## ⬡ Experience

```text
go / golang        ████████████   7y   distributed backend, cross-chain engines
node / typescript  ███████████    6y   APIs, real-time event ingestion, coordination
solidity           ██████████     5y   defi protocols, NFT infra, account abstraction
rust               ████████       4y   latency-sensitive execution (tokio, anchor)
postgres / redis   ████████       4y   persistence, idempotency, caching, indexing
docker / k8s       ███████        4y   containerization, CI/CD, zero-downtime deploys
ai / llm           ███████        3y   agentic workflows, RAG, MCP, Claude API
solana / anchor    █████          2y   non-EVM programs (SPL, PDAs, CPIs)
```

<br/>

## ⬡ Where I've Worked

- **RheoFi** · *Senior Software Developer* · Sep 2025 – Present
  Architecting an isolated-pool lending protocol on XRP EVM: 50+ upgradeable Solidity contracts with a `ResilientOracle` (Chainlink/Pyth fallback), RBAC, and Timelock governance. Built the Go/Rust execution backend (~12k ops/day, p99 < 450ms) and an event-driven agent-orchestration layer where ERC-4337 session keys let AI agents act on-chain within user limits, with intent interpretation via Claude API + MCP.

- **HyperPNL** · *Senior Software Developer* · Jan 2024 – Aug 2025
  Led 3 engineers across backend and contracts. Built the Go/Node coordination layer (20k+ daily ops, no state inconsistencies) and Rust/Tokio services for Solana execution at p99 < 600ms. Shipped Solana programs (Anchor/SPL/PDAs/CPIs) and ERC-4337 with paymaster gas sponsorship; owned the Docker/K8s + observability stack; designed LayerZero/Wormhole cross-chain messaging.

- **Nervos** · *Software Developer* · Jun 2022 – Jan 2024
  Built Go cross-chain execution engines and Node/TS client APIs over RPC/WebSocket. Owned DevOps for cross-chain deployments (Terraform IaC, CI/CD across GCP/AWS). Designed DeFi infra (ERC-4626 vaults, Compound-style rate models, a perp-futures AMM) and audited with Slither/MythX, cutting tx costs ~35% vs L1.

- **Indorse** · *Software Engineer* · May 2019 – Jun 2022
  Built Node backend services and REST APIs for an NFT marketplace (MongoDB + Redis). Shipped ERC-721/1155 contracts with Transparent/UUPS upgradeability (cut batch-transfer gas ~30%), a full listing/bidding/settlement marketplace, and EIP-2771 meta-transactions for gasless onboarding.

<br/>

## ⬡ Featured Work

<table>
<tr>
<td width="50%" valign="top">

### [Perplex](https://github.com/ozpool/Perplex)
**Perpetual-futures DEX** · Rust + Solidity

dYdX-style hybrid perp exchange. Off-chain matching in Rust (axum/tokio), on-chain EIP-712 settlement via a custom `SettlementEngine` across BTC/ETH/SOL. Redis leader election for single-writer funding posting, `O(1)` lazy accrual, and a full `LiquidationEngine → InsuranceFund → ADL` backstop fed by a Pyth Hermes relayer.

</td>
<td width="50%" valign="top">

### [PRISM](https://github.com/ozpool/prism)
**Liquidity management on Uniswap V4** · Solidity + TS

Splits one LP deposit into N tick-range positions and rebalances atomically with EIP-1153 flash accounting in a single `PoolManager` unlock. A V4 hook applies volatility-adaptive fees and MEV observation. Immutable, custody-free core with seven formal Foundry invariants; Slither + Aderyn in CI.

</td>
</tr>
<tr>
<td width="50%" valign="top">

### [devbounty-backend](https://github.com/ozpool/devbounty-backend)
**Bug-bounty escrow** · Solidity + TS

Smart-contract escrow on Arbitrum (USDC) released by GitHub merge webhooks. An npm-workspaces monorepo: Express API, chain indexer, and Hardhat contracts.

</td>
<td width="50%" valign="top">

### [Eigenvex](https://github.com/ozpool/Eigenvex)
**Perpetual futures on Solana** · Rust

Hybrid orderbook + vAMM, cross-margin, DAO-curated listings.

</td>
</tr>
</table>

<br/>

## ⬡ Stack

| | |
|---|---|
| **Languages** | Go · Rust · TypeScript · JavaScript · Python · Solidity |
| **Backend & Systems** | microservices · event-driven · gRPC · REST · WebSockets · message queues · pub/sub · idempotency · horizontal scaling · fault tolerance · Gin · Fiber · Axum · Actix · Express |
| **Concurrency** | goroutines · Tokio · async/await |
| **Data** | PostgreSQL · Redis · MongoDB · time-series · query optimization · indexing · connection pooling |
| **AI / LLM** | Claude API · Anthropic SDK · OpenAI API · MCP · LangChain · RAG · Pinecone · LLM-assisted testing & review |
| **DevOps & Infra** | Docker · Kubernetes · Terraform · AWS · GCP · GitHub Actions CI/CD · zero-downtime deploys · Prometheus · Grafana · SRE |
| **Contracts** | Foundry · Hardhat · OpenZeppelin · Anchor · SPL · Tenderly |
| **Web3 Libs** | ethers.js · viem · wagmi · web3.js · solana-web3.js · The Graph · Alchemy · Infura |
| **Standards** | ERC-20/721/1155/4626 · ERC-4337 · EIP-712/2612/2771/2981 · UUPS & Transparent Proxy |
| **Protocols / Bridges** | Chainlink · Pyth · LayerZero · Wormhole · Hyperlane · Aave · Compound · Curve |
| **Chains** | Ethereum · Arbitrum · Optimism · Base · Polygon · BNB Chain · Solana |
| **Security** | Slither · MythX · Aderyn · Foundry invariants · Echidna · internal & external audits |

<br/>

## ⬡ Open Source

Selected upstream contributions, full PR history linked per repo.

- **[cosmos/cosmos-sdk](https://github.com/cosmos/cosmos-sdk/pulls?q=author%3Aozpool)** : isolated trace-context state across branched cache stores; propagated codec signing options into transaction config; added gRPC / `FinalizeBlock` concurrency-safety coverage in `BaseApp`.
- **[ethereum/go-ethereum](https://github.com/ethereum/go-ethereum/pulls?q=author%3Aozpool)** : upgraded the NAT-traversal stack (`pion/stun` v3) to pull in a fixed DTLS dependency; hardened a WebSocket read-limit test for cross-platform reliability.
- **[solana-foundation/solana-go](https://github.com/solana-foundation/solana-go/pulls?q=author%3Aozpool)** : RPC client constructors with commitment/timeout options; extended WebSocket subscriptions (`dataSlice`, received-notifications); forwarded `MinContextSlot`; added BIP-39 mnemonic wallet derivation.
- **[smartcontractkit/chainlink](https://github.com/smartcontractkit/chainlink/pulls?q=author%3Aozpool)** : contributions across the Chainlink node and oracle tooling.
- **[Soju06/codex-lb](https://github.com/Soju06/codex-lb/pulls?q=author%3Aozpool)** : contributions to the load-balancer project.

<br/>

<div align="center">

[![ozpool's contributions](https://ghchart.rshah.org/06B6D4/ozpool)](https://github.com/ozpool)

**Open to senior backend / DeFi roles, audits, and contracts** · ~24h response

<sub><i>deep pool, slow drain.</i></sub>

</div>
