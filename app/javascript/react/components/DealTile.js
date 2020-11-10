
import React, { useEffect, useState, Fragment } from "react";


const DealTile = (props) => {

  return (
    <div className="deal-tile">
      <p>{props.dealName}</p>
    </div>
  )
}

export default DealTile