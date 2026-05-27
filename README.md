<div align="center">

```text
┌───────────────────────────────────────────────────┐
│  ozpool · blockchain & smart-contract engineer    │
│  five years writing code that holds under load    │
└───────────────────────────────────────────────────┘
```

</div>

## about

I write contracts and the off-chain plumbing that keeps them honest. Five years
across DeFi lending, NFT infrastructure, and cross-chain messaging — Solidity
when the chain is the source of truth, Rust and Go when it isn't. The code I
ship runs under adversarial conditions, so I optimise for the qualities that
matter there: events on every state change, return values checked, threat
model written before the first line of logic.

Lately reading more on MEV-aware design, the gap between Chainlink and Pyth
oracle assumptions, and what intent-based execution actually changes about
contract architecture.

## depth chart

```text
solidity     ████████████   5y
typescript   █████████      4y
rust         ████████       3y
go           ████           2y
foundry      ███████████    ~5y
layerzero    ██████         3y
```

## what i'm building

| repo | what it does | stack | status |
| :--- | :--- | :--- | :--- |
<!-- TODO: real repo rows -->
| _to be filled_ | _ozpool projects land here once pinned_ | — | — |

## invariants

- every state change emits an event
- every external call's return value is checked
- threat model is written before implementation, not after
- no `unchecked` block without a comment proving the math
- upgradability is a feature, not a default — `UUPS` only where it earns its rent

## security work

Slither + Foundry invariants + a manual pass against an explicit threat model.
Reentrancy, oracle manipulation, access control, arithmetic edges.

- available for solidity audits and pre-launch threat modelling
- bridge / cross-chain message-integrity reviews
- invariant-suite design for new protocols

## ecosystem contributions

<!--
  Auto-refreshed twice daily by .github/workflows/update-readme.yml.
  Do not edit content between START:ecosystem and END:ecosystem by hand.
-->

<!-- START:ecosystem -->
_no contributions indexed yet — workflow will populate this block on next run._
<!-- END:ecosystem -->

## issues filed

### open

<!-- START:issues-open -->
_pending workflow run._
<!-- END:issues-open -->

### closed

<!-- START:issues-closed -->
_pending workflow run._
<!-- END:issues-closed -->

---

<p align="center"><sub><i>deep pool, slow drain.</i></sub></p>
