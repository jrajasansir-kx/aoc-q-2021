
input:read0 `$":input/day-08.data";

signals:" " vs/: first each " | " vs/: input;
outputs:" " vs/: last each " | " vs/: input;


.d8.p1:{
    digits:2 4 3 7;
    :count raze where each (count@/:/: outputs) in\: digits;
 };

/
Day 8 Notes
-----------

- Count all the 2D array 'outputs' ('count@/:/:') and look for matches against the lengths of digits ('in\:')
