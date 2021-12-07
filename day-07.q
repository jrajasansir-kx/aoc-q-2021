
input:read0 `$":input/day-07.data";
parsed:"J"$"," vs first input;


.d7.p1:{
    moves:sum each abs parsed -/: til max parsed;
    :first moves where moves = min moves;
 };

.d7.p2:{
    moves:sum each sum@/:/: 1 + til@/:/:abs parsed -/: til max parsed;
    :first moves where moves = min moves;
 };


/
Day 7 Notes
-----------

- Get all target positions from 0 to the maximum value in the index ('til max parsed')
- Calculate the move for each element to each target position ('-/:')
- Return the smallest

Part 2:

  - Same idea, but for each difference get the range ('til') and sum each individual element ('sum@/:/:') before summing each row
  - A bit memory intensive!
