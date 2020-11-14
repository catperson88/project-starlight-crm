
import React, { useEffect, useState, Fragment } from "react";
import { useMotionValue, motion, animate } from 'framer-motion';


function DealTile({ id, dealName, value, onDrag }) {
	const [isDragging, setIsDragging] = React.useState(false);
	const [isTransitioning, setIsTransitioning] = React.useState(false);


	const handleDragStart = (event) => {
		console.log(event);
		setIsDragging(true);
		if (onDrag) onDrag(id);
	};
	const handleDrag = (event) => {
	};
	const handleDragEnd = (event) => {
		console.log(event);
		setIsDragging(false);
		setIsTransitioning(true);
	};
	const handleTransitionEnd = () => {
		setIsTransitioning(false);
	};


	

  return (
		<motion.div
			className="tile"
		>
			<div
				draggable
				onDragStart={handleDragStart}
				onDrag={handleDrag}
				onDragEnd={handleDragEnd}
			>
				<div className="title-segment"><a href={`/deals/${id}`}>{dealName}</a></div>
				<div className="content-segment">{value}</div>
			</div>
		</motion.div>
	);
}
 
export default DealTile