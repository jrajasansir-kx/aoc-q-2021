
input:"I"$read0 `$":input/day-01.data";

.d1.p1:{
    :count 1_ where 1 = signum deltas input;
 };

.d1.p2:{
    sliding:(::; next; '[next; next]) @\: input;

    slideSum:sum[sliding] except 0N;
    :count 1_ where 1 = signum deltas slideSum;
 };
