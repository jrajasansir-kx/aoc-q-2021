
input:read0 `$":input/day-05.data";
parsed:"J"$"," vs/:/: trim "->" vs/: input;


.d5.p1:{
    hv:parsed where any each (=)./: parsed;

    minCoord:min each hv;
    moves:til@/:/: 1+ abs (-)./:hv;

    points:(cross) .' minCoord +' moves;
    pointCount:count each group raze points;

    :count where 2 <= pointCount;
 };

.d5.p2:{
    hv:parsed where any each (=)./: parsed;
    minCoord:min each hv;
    moves:til@/:/: 1+ abs (-)./:hv;

    points:raze (cross) .' minCoord +' moves;

    diag:parsed where not any each (=)./: parsed;
    minCoord:min each diag;
    moves:til@/:/: 1+ abs (-)./:diag;

    / There must be a better way to generate the moves with the correct reversal
    points,:raze (,') ./: ({ @[y; z; reverse] }\)[(); minCoord +' moves; where each (>)./: diag];

    pointCount:count each group points;
    :count where 2 <= pointCount;
 };


/
Day 5 Notes
-----------

 - parsed is list of lists - (x1 y1; x2 y2)
 - Filter to where one of x / y co-ordinates match
   - '=' will (x1 = x2) and (y1 = y2) in each element of list because the list is uniform
 - Get the moves between the 2 points by calculating the difference ('abs (-)./:') and getting the count from 0 to x ('til')
 - Add the moves to the starting min co-ordinates
 - Combine the x and y to get co-oridinates ('cross') - works because one co-ordinate will be fixed
 - 'group' to count the occurances of each distinct co-ordinate pair

Part 2

 - Use part 1 for all horizontal and verticals
 - For diagonals calulate the points the same but because co-ordinate changes on both 'x' and 'y'
   - Calculate which co-ordinate is the larger of (x1; x2) and (y1; y2) and reverse the list where true
   - Zip the co-ordinates together (,')
