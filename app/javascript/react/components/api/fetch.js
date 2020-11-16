/**
 * Method for configuring a request.
 * @param endpoint
 * @param method
 * @param query
 * @param body
 * @returns {Promise<any>}
 */
export async function makeRequest(endpoint, method = 'GET', query, body) {
  const base = `${location.protocol}//${location.host}`;
  const url = new URL(endpoint, base);
  if (query) Object.keys(query).forEach(key => url.searchParams.append(key, query[key]))

  try {
    const response = await fetch(
      url.toString(), 
      {
        method,
        body: JSON.stringify(body),
      }
    );

    if (!response.ok) throw Error(`${response.status} (${response.statusText})`);
    return response.json();
  } catch (error) {
    console.error(`Error in fetch: ${error.message}`);
    return error
  }
}





