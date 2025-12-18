# Design Rationale — Blockchain-Based Decision Audit Ledger

## Purpose

This document explains the architectural and design decisions behind the Blockchain-Based Decision Audit Ledger.

The objective is to justify the use of blockchain technology in a way that is proportionate, privacy-aware, and aligned with real-world constraints in regulated environments.

---

## Why Blockchain?

Traditional databases can efficiently store decision records, but they rely on internal controls and trust to ensure data integrity.

In regulated or dispute-prone environments, this creates challenges such as:
- Difficulty proving records were not altered retrospectively
- Limited independent verifiability
- Heavy reliance on internal audit processes

Blockchain introduces:
- Immutability through cryptographic linking
- Independent verifiability
- Tamper-evident record keeping

In this project, blockchain is used specifically to **strengthen trust and audit confidence**, not to replace existing systems.

---

## Why a Hybrid Architecture?

Storing full decision records directly on-chain is neither practical nor desirable.

Key limitations include:
- Data privacy and regulatory constraints
- High storage and transaction costs
- Performance and scalability concerns

This project therefore adopts a hybrid model:

### On-Chain
- Cryptographic hash of the decision payload
- Timestamped audit events
- Minimal metadata required for verification

### Off-Chain
- Full decision details
- Contextual metadata
- Analytical datasets and dashboards

This ensures integrity without exposing sensitive information.

---

## Integrity Verification Model

Each decision is represented as a structured payload (e.g. JSON).  
A cryptographic hash is generated from this payload and recorded on-chain.

To verify integrity:
1. The off-chain payload is re-hashed
2. The hash is compared against the on-chain record
3. A match confirms the record has not been altered

This model provides strong integrity guarantees with minimal on-chain complexity.

---

## Event-Based Logging vs State Storage

Rather than storing mutable state on-chain, the system records immutable events.

Advantages of this approach:
- Clear audit trail over time
- No need for on-chain updates or deletions
- Improved transparency of decision lifecycles

Events represent actions such as:
- Decision created
- Decision escalated
- Decision resolved

This aligns with audit and compliance requirements.

---

## Access Control Considerations

Role-based access control is applied to ensure:
- Only authorised roles can submit audit events
- All actions are attributable to a defined role

While identities are abstracted in this project, the design supports integration with enterprise identity systems.

---

## Trade-Offs and Limitations

This design intentionally prioritises:
- Integrity over convenience
- Auditability over mutability
- Transparency over optimisation

Limitations include:
- Blockchain transaction costs
- Latency compared to local databases
- Dependence on external blockchain infrastructure

These trade-offs are acceptable given the trust and audit benefits provided.

---

## Design Outcome

The resulting architecture:
- Strengthens trust in decision records
- Supports independent verification
- Preserves privacy and scalability
- Integrates with existing systems rather than replacing them

This design reflects a balanced, real-world application of blockchain technology.
