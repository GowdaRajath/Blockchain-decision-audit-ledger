# System Architecture — Blockchain-Based Decision Audit Ledger

## Overview

This project implements a hybrid architecture to provide tamper-evident auditability for critical decisions in regulated environments.

The design intentionally separates:
- **On-chain proofs** (integrity, ordering, timestamps)
- **Off-chain payloads and analytics** (privacy, scalability, dashboards)

---

## Components

### 1. Client / UI (Dashboard)
A user interface used to:
- submit synthetic decision events
- view decision traceability over time
- verify integrity (hash match vs mismatch)
- explore transparency metrics and trends

Outputs include dashboard screenshots for portfolio evidence.

---

### 2. Backend API (Off-Chain Service)
A service responsible for:
- receiving decision payloads (JSON)
- normalising and hashing payloads
- submitting hashes/events to the smart contract
- storing payloads and metadata off-chain
- providing verification endpoints for dashboards

---

### 3. Off-Chain Storage
Stores:
- full decision payloads (synthetic JSON)
- metadata (decision stage, lifecycle state, actor role)
- analytics tables for dashboards

Off-chain storage is required for privacy and scalability.

---

### 4. Smart Contract (On-Chain Proof Layer)
Stores and emits:
- decision identifiers
- event types (create, escalate, resolve)
- cryptographic payload hashes
- timestamps and transaction references

The contract is minimal by design to reduce:
- cost
- complexity
- attack surface

---

## Data Flow (High Level)

1. User submits a decision event (synthetic JSON payload)
2. Backend hashes the payload (e.g., SHA-256)
3. Backend stores payload off-chain
4. Backend submits the hash and event metadata on-chain
5. Dashboard displays:
   - event history (traceability)
   - verification status (integrity)
   - transparency metrics

---

## On-Chain vs Off-Chain Responsibilities

### On-Chain (Proof & Traceability)
- Immutable event log
- Hash-based integrity anchor
- Ordering and timestamping
- Role-based access for event submission

### Off-Chain (Privacy & Analytics)
- Detailed payload storage
- Search and filtering
- Dashboards and reporting
- Data enrichment for insight generation

---

## Verification Model

To verify integrity:
1. Retrieve off-chain payload for a decision event
2. Recompute hash from payload
3. Compare against on-chain stored hash
4. Display:
   - Verified (match)
   - Failed verification (mismatch)
   - Missing on-chain event

This enables tamper evidence without exposing sensitive content on-chain.

---

## Expected Outputs for This Repository

- Architecture diagram (image)
- Smart contract code implementing audit events
- Backend API for hashing, storage, and verification
- Dashboard visuals showing transparency and integrity metrics
- Synthetic dataset of decision events for demonstration
