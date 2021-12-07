
input:read0 `$":input/day-06.data";
parsed:"J"$"," vs first input;

.d6.p1:{
    :count 80 .d6.cycle/ parsed;
 };

.d6.cycle:{
    zero:where 0 = x;

    new:@[x; zero; :; 6];
    new:@[new; where not 0 = x; -[;1]];
    new,:count[zero]#8;
    
    :new;
 };
