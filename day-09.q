
input:read0 `$":input/day-09.data";
parsed:"I"$/:/:input;

.d9.p1:{
    coords:(til count parsed) cross til count first parsed;

    neighCoords:distinct each (-1 + count each (parsed; first parsed)) &/:/: 0 | coords +/:\: (-1 0; 1 0; 0 -1; 0 1);
    neighCoords:neighCoords except' enlist each coords;

    neighVals:parsed ./:/: neighCoords;
    :sum 1 + raze[parsed] where all each raze[parsed] <' neighVals;
 };

/
Day 9 Notes
-----------

Part 1

 - Build list of coordinates based on input
 - Build list of neighbour coordinates for each coordinate
   - Bound to min 0 ('0 |') and maximum in each axis ('&/:/:')
   - After bounding, make sure to remove any coordinates that now match the original (e.g. neighbour of 0 0 -> -1 0, boundsed to 0 0 should be removed)
 - Derference coordinates to values ('./:/:')
 - Flatten original input (to match neighbour list) ('raze') and compare (<')


