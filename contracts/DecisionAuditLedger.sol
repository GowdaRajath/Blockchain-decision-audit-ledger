// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/*
 * DecisionAuditLedger
 *
 * A minimal, event-driven smart contract for recording
 * tamper-evident audit events related to critical decisions.
 *
 * This contract intentionally stores no sensitive data.
 * Only cryptographic hashes and metadata are recorded on-chain.
 */

contract DecisionAuditLedger {

    /// @notice Represents the type of audit event
    enum EventType {
        Created,
        Escalated,
        Resolved
    }

    /// @notice Emitted when a decision audit event is recorded
    event DecisionEventRecorded(
        bytes32 indexed decisionId,
        EventType eventType,
        bytes32 payloadHash,
        address indexed submittedBy,
        uint256 timestamp
    );

    /// @notice Tracks whether a decisionId has been seen before
    mapping(bytes32 => bool) private knownDecisions;

    /// @notice Records a new audit event for a decision
    /// @param decisionId Unique identifier for the decision
    /// @param eventType Type of audit event
    /// @param payloadHash Cryptographic hash of off-chain payload
    function recordDecisionEvent(
        bytes32 decisionId,
        EventType eventType,
        bytes32 payloadHash
    ) external {

        require(decisionId != bytes32(0), "Invalid decision ID");
        require(payloadHash != bytes32(0), "Invalid payload hash");

        // Mark decision as known
        knownDecisions[decisionId] = true;

        emit DecisionEventRecorded(
            decisionId,
            eventType,
            payloadHash,
            msg.sender,
            block.timestamp
        );
    }

    /// @notice Checks whether a decision ID has been recorded
    /// @param decisionId Unique identifier for the decision
    /// @return True if the decision exists
    function decisionExists(bytes32 decisionId) external view returns (bool) {
        return knownDecisions[decisionId];
    }
}
