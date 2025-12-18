const { generatePayloadHash, verifyPayloadIntegrity } = require("../hashing/hash-utils");

/**
 * Example synthetic decision payload
 */
function createDecisionPayload(decisionId, stage, actorRole, outcome) {
  return {
    decisionId,
    stage,
    actorRole,
    outcome,
    timestamp: new Date().toISOString(),
  };
}

/**
 * Simulates submitting a decision event
 */
function submitDecision(payload) {
  const hash = generatePayloadHash(payload);

  return {
    payload,
    payloadHash: hash,
    submittedAt: new Date().toISOString(),
  };
}

/**
 * Simulates verification against blockchain-stored hash
 */
function verifyDecision(payload, onChainHash) {
  return verifyPayloadIntegrity(payload, onChainHash);
}

module.exports = {
  createDecisionPayload,
  submitDecision,
  verifyDecision,
};
