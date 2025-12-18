const crypto = require("crypto");

/**
 * Generates a SHA-256 hash for a decision payload
 * @param {Object} payload - decision data
 * @returns {string} hex encoded hash
 */
function generatePayloadHash(payload) {
  const normalised = JSON.stringify(payload);
  return crypto.createHash("sha256").update(normalised).digest("hex");
}

/**
 * Verifies a payload against an on-chain hash
 * @param {Object} payload
 * @param {string} onChainHash
 * @returns {boolean}
 */
function verifyPayloadIntegrity(payload, onChainHash) {
  const computedHash = generatePayloadHash(payload);
  return computedHash === onChainHash;
}

module.exports = {
  generatePayloadHash,
  verifyPayloadIntegrity,
};

