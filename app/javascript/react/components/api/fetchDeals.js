import * as React from 'react';

/**
 * Method for configuring a request.
 * @param endpoint
 * @param method
 * @param query
 * @param body
 * @returns {Promise<any>}
 */
export async function makeRequest(endpoint, method = 'GET', query, body) {
  const url = new URL(endpoint);
  if (query) Object.keys(query).forEach(key => url.searchParams.append(key, query[key]))

  try {
    const response = await fetch({
      url: endpoint,
      method,
      body: JSON.stringify(body),
    });

    if (!response.ok) throw Error(`${response.status} (${response.statusText})`);
    return response.json();
  } catch (error) {
    console.error(`Error in fetch: ${error.message}`);
  }
}

/**
 * Convenience method for a predefined network call
 * @returns {Promise<*>}
 */
export function fetchDeals() {
  return makeRequest('/api/deals.json');
}

/**
 * Example component for using this method of network request,
 * please place in the correct folder!
 */
function FakeComponent(props) {

  const [someData, setSomeData] = React.useState(null);

  React.useEffect(() => {
    fetchDeals().then(setSomeData);
  }, []);

  return (
    <div>
      {JSON.stringify(someData)}
    </div>
  )
}


