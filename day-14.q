
input:read0 `$":input/day-14.data";

template:first first 2 cut input;
inRules:(!). flip " -> " vs/: 2_ input;


.d14.p1:{
    result:10 .d14.step/ template;

    charCount:count each group result;
    :(-) . (max; min) @\: charCount;
 };


.d14.step:{
    lookup:x ,' next x;
    :raze (lookup @\: 0) ,' inRules lookup;
 };
