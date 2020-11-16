import React, { useEffect, useState, Fragment } from "react";
import DealTile from "./DealTile";
import shortid from "shortid";
import Column from "./Column"
import { fetchDeals } from "./api/board";

function camelize(str) {
  return str.replace(/(?:^\w|[A-Z]|\b\w)/g, function (word, index) {
    return index === 0 ? word.toLowerCase() : word.toUpperCase();
  }).replace(/\s+/g, '');
}


const Board = (props) => {



	const [getDealData, setDealData] = useState([]);
	
	

  const [positions, setPositions] = React.useState([])
 
  

  const dealStages = ["Lead", "Qualified Lead", "Meeting", "Presentation", "Negotiation", "Closed Won", "Closed Lost", "Disqualified"]


  const [columns, setColumns] = useState( dealStages.map((stage)=> ({
    id: camelize(stage),
    name: stage
  })));

  const [lastDragged, setLastDragged] = React.useState(null);
  
  useEffect(() => {
    fetchDeals()
    .then(body => {
      setDealData(body.deals);
      setPositions(body.deals.map((c) => ({
        cardId: c.id,
        columnId: camelize(c.stage) || columns[0].id,
      })))
    })
  }, [])


  const columnComponents = columns.map((c) => (
    <Column
      key={c.id}
      id={c.id}
      cards={getDealData}
      lastDragged={lastDragged}
      setLastDragged={setLastDragged}
      positions={positions}
      setPositions={setPositions}
      stage = {c.name}
    />
  ));

  
  return (

      <div className="column-container">{columnComponents}</div>

  );
}
		  


export default Board