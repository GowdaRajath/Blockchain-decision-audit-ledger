# Research Reading List — Blockchain Audit & Transparency Systems

## Purpose

This document lists key academic and industry resources that informed the design of the Blockchain-Based Decision Audit Ledger.

The focus of this research is on:
- Tamper-evident audit trails
- Integrity verification using cryptographic hashes
- Hybrid on-chain / off-chain architectures
- Transparency and accountability in regulated systems

The references below are used to justify architectural and design decisions in this project.

---

## Blockchain-Based Audit Trails

### BlockAudit — Tamper-Proof Audit Logs Using Blockchain
- Demonstrates how blockchain can be used to ensure immutability of audit records
- Highlights scalability and integrity challenges in traditional logging systems

Reference:
https://dl.acm.org/doi/10.1145/3286978.3286985

---

### A Secure and Auditable Logging Infrastructure Based on Blockchain
- Explores blockchain-backed logging for secure auditability
- Supports hybrid designs where logs are verified rather than fully stored on-chain

Reference:
https://www.sciencedirect.com/science/article/abs/pii/S0167404818313907

---

### RootLogChain — Blockchain-Based Log Integrity
- Discusses integrity verification of logs using blockchain
- Reinforces the importance of tamper resistance and verifiability

Reference:
https://pmc.ncbi.nlm.nih.gov/articles/PMC8621924/

---

## Hash-Based Integrity & Off-Chain Storage

### Automating Event Log Integrity Using On-Chain Hashes
- Supports the pattern of storing cryptographic hashes on-chain
- Full payloads remain off-chain for privacy and scalability

Reference:
https://jsdp.rcisp.ac.ir/article-1-1451-en.html

---

## Transparency & Trust in Regulated Systems

### Providing Tamper-Resistant Audit Trails with Distributed Ledgers
- Discusses transparency requirements in regulated environments
- Highlights the role of immutable ledgers in dispute resolution

Reference:
https://personales.upv.es/thinkmind/dl/journals/sec/sec_v11_n34_2018/sec_v11_n34_2018_10.pdf

---

## Design Implications for This Project

Based on the research above, this project adopts:
- A hybrid architecture (on-chain proofs, off-chain data)
- Cryptographic hashing for integrity verification
- Event-based logging for traceability
- Minimal on-chain logic to reduce cost and complexity

These principles are expanded further in the design rationale and threat model documentation.
