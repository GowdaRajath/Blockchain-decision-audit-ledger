# Threat Model — Blockchain-Based Decision Audit Ledger

## Purpose

This document outlines the threat model for the Blockchain-Based Decision Audit Ledger.

It identifies potential risks, attack vectors, and failure scenarios, and explains how the system design mitigates them. It also explicitly documents limitations where risks remain.

---

## Assets to Protect

The system is designed to protect the integrity and traceability of:
- Decision audit records
- Decision lifecycle events
- Timestamps and sequencing of actions
- Proof of non-modification

The confidentiality of sensitive decision data is handled off-chain.

---

## Threat Actors

Potential threat actors include:
- Internal users with elevated access
- Malicious insiders attempting to modify records
- External attackers attempting to inject or replay data
- System misconfiguration or operational errors

---

## Threat Scenarios & Mitigations

### 1. Retrospective Modification of Decision Records

**Threat:**  
An internal user alters historical decision data to change outcomes or narratives.

**Mitigation:**  
- Cryptographic hashes of decision payloads are recorded on-chain
- Any modification to off-chain data results in hash mismatch
- Immutable blockchain records provide tamper evidence

---

### 2. Deletion or Suppression of Audit Events

**Threat:**  
Audit events are deleted or not recorded to conceal actions.

**Mitigation:**  
- Event-based logging ensures all actions are append-only
- Missing on-chain events can be detected during audits
- Dashboards can flag incomplete audit trails

---

### 3. Replay or Duplicate Event Submission

**Threat:**  
An attacker resubmits a valid event to create misleading records.

**Mitigation:**  
- Decision identifiers and event sequencing prevent duplication
- Smart contracts reject duplicate or invalid submissions
- Event timestamps support anomaly detection

---

### 4. Unauthorized Event Submission

**Threat:**  
Unapproved actors submit false audit records.

**Mitigation:**  
- Role-based access control at the smart contract level
- Only authorised roles can emit audit events
- All actions are attributable to defined roles

---

### 5. Blockchain Infrastructure Failure

**Threat:**  
Blockchain network congestion, outage, or reorganisation affects availability.

**Mitigation:**  
- Off-chain systems remain operational
- On-chain verification can be retried
- Integrity guarantees remain intact once transactions are finalised

---

### 6. Data Privacy Exposure

**Threat:**  
Sensitive data is exposed through on-chain storage.

**Mitigation:**  
- No sensitive payloads are stored on-chain
- Only cryptographic proofs and minimal metadata are recorded
- Off-chain systems handle access control and data privacy

---

## Out-of-Scope Threats

The following are explicitly out of scope:
- Compromise of endpoint devices
- Identity theft outside system integration
- Social engineering attacks

These risks require organisational and procedural controls.

---

## Security Limitations

This system:
- Detects tampering rather than preventing all forms of misuse
- Does not guarantee correctness of initial data input
- Relies on correct role assignment and governance

These limitations are documented to ensure realistic expectations.

---

## Security Outcome

The threat model demonstrates that the system:
- Provides strong tamper evidence
- Improves audit confidence
- Supports transparent investigation
- Complements, rather than replaces, organisational controls
