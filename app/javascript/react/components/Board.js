import React, { useEffect, useState, Fragment } from "react";
import DealTile from "./DealTile";

const Board = (props) => {

  const [ getDealData, setDealData] = useState([]);

  useEffect(() => {
    fetch('/api/deals.json')
      .then(response => {
        console.log("Response was")
        console.log(response)

        if (response.ok) {
          return response
        } else {
          let errorMessage = `${response.status} (${response.statusText})`,
            error = new Error(errorMessage)
          throw error
        }
      })
      .then(response => response.json())
      .then(body => {
        setDealData(body.deals);
      })
      .catch(error => console.error(`Error in fetch: ${error.message}`))
  }, []);

  
  const dealTiles = getDealData.map((deal) => {
    return (
    < DealTile
      key = { deal.id }
      id = { deal.id }
      dealName = { deal.deal_name }
      value = { deal.value }
    />
    )
})
  
  // const drop = event => {
  //   event.preventDefault();
  //   const card_id = event.dataTransfer.getData('card_id');
  // }

  return (
    <div>
      {dealTiles}
    </div>
  )
}

export default Board