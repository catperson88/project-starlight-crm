import * as React from "react";
import DealTile from "./DealTile";



function Column({
  id,
  stage,
  positions,
  cards,
  lastDragged,
  setLastDragged,
  setPositions,
}) {
  const dealPositions = positions.filter(({ columnId }) => columnId === id);
  const dealCards = dealPositions.reduce((acc, cv) => {
    const matchingDeal = cards.find((deal) => deal.id === cv.cardId);
    return matchingDeal ? [...acc, matchingDeal] : acc;
  }, []);
  
  const dealComponents = dealCards.map(
    ({ id, deal_name: dealName, value }) => (
      <DealTile
        key={id}
        id={id}
        dealName={dealName}
        value={value}
        onDrag={setLastDragged}
      />
    )
  );
  const handleDrop = (columnId) => (event) => {
    event.preventDefault();
    console.log(columnId, lastDragged);
    if (!lastDragged) return;
    setPositions([
      ...positions.filter((p) => p.cardId !== lastDragged),
      { cardId: lastDragged, columnId },
    ]);
  };
  const handleCancel = (event) => {
    event.preventDefault();
    event.stopPropagation();
  };

  return (
    <div className="column">
      <div className="column-title">{stage}</div>
      <div
        className="column-deals"
        onDragOver={handleCancel}
        onDragEnter={handleCancel}
        onDrop={handleDrop(id)}
      >
        {dealComponents}
      </div>
    </div>
  );
}

export default Column;
