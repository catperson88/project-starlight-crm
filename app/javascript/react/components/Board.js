import React, { useEffect, useState, Fragment } from "react";
import { fetchDeals } from "./api/fetchDeals";
import DealTile from "./DealTile";

const Board = (props) => {

  const [ getDealData, setDealData] = useState([]);

  useEffect(() => {
    fetchDeals.then(body => setDealData(body.deals))
  },[])

  
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