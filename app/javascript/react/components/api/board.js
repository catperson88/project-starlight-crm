/**
 * Convenience method for a predefined network call
 * @returns {Promise<*>}
 */
export function fetchDeals() {
  return makeRequest('/api/deals.json');
}

