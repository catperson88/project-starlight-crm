import React, { useEffect, useState, Fragment } from "react";
import DealTile from "./DealTile";
import shortid from "shortid";
import Column from "./Column"

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
    fetch('/api/deals.json')
      .then(response => {
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
        setPositions(body.deals.map((c) => ({
          cardId: c.id,
          columnId: c.stageId || columns[0].id, 
        })))
      })
      .catch(error => console.error(`Error in fetch: ${error.message}`))
  }, []);




  const columnComponents = columns.map((c) => (
    <Column
      key={c.id}
      id={c.id}
      cards={getDealData}
      lastDragged={lastDragged}
      setLastDragged={setLastDragged}
      positions={positions}
      setPositions={setPositions}
      stage = {name}
    />
  ));

  
  return (

      <div className="column-container">{columnComponents}</div>

  );
}
		  


export default Board