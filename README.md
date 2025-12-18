# Blockchain-Based Decision Audit Ledger

## Abstract

This project explores the use of blockchain technology to create a transparent, tamper-evident audit ledger for critical business decisions in regulated environments.

The system is designed to ensure that decisions such as complaint resolutions, approvals, and policy changes can be independently verified, traced over time, and protected against unauthorised modification.

Rather than storing sensitive data directly on-chain, the project implements a hybrid architecture where cryptographic proofs are recorded on a blockchain while detailed records remain off-chain.

---

## Problem Statement

In regulated industries, decision records are often stored in mutable systems that rely heavily on internal controls and trust.

This creates challenges such as:
- Limited transparency in decision histories
- Difficulty proving data integrity during disputes
- Risk of retrospective modification
- Low audit confidence for regulators and customers

This project investigates how blockchain-based audit logging can strengthen trust, accountability, and traceability without exposing sensitive data.

---

## Objectives

- Design a tamper-evident audit ledger for critical decisions  
- Implement cryptographic integrity verification using blockchain  
- Enable traceability of decision lifecycles  
- Provide analytical visibility through dashboards and metrics  
- Evaluate trade-offs between blockchain and traditional systems  

---

## Scope

This repository focuses on:
- Decision audit logging
- Integrity verification
- Traceability analysis
- Transparency metrics

All data used in this repository is synthetic and anonymised.

---

## High-Level Architecture

The system follows a **hybrid on-chain / off-chain architecture** designed to balance integrity, transparency, privacy, and scalability.

### On-Chain (Blockchain Layer)
- Cryptographic hashes of decision payloads
- Immutable audit events (create, escalate, resolve)
- Timestamps and ordering guarantees
- Role-based access control for event submission

### Off-Chain (Application & Analytics Layer)
- Full decision payload storage (synthetic JSON)
- Metadata and lifecycle context
- Integrity verification logic
- Dashboards and analytical views

This separation ensures strong audit guarantees without exposing sensitive data on-chain.

<!-- Architecture diagram goes here -->
<p align="center">
  <img src="visuals/architecture.png" alt="Hybrid architecture diagram" width="800">
</p>

---

## Data Flow Overview

1. A decision event is submitted via the dashboard or API  
2. The backend normalises and hashes the decision payload  
3. The payload is stored off-chain for privacy and analytics  
4. The hash and event metadata are recorded on-chain  
5. Dashboards retrieve events and verify integrity by re-hashing payloads  

---

## Analytics & Transparency

The system supports analytical visibility across decision lifecycles, including:

- Volume of decisions logged
- Decision stage transitions (create → escalate → resolve)
- Time between decision events
- Verification status (hash match vs mismatch)
- Completeness of audit trails

These metrics are presented through dashboards and visual outputs included in the repository.

---

## Security & Threat Model

A detailed threat model is documented in:

