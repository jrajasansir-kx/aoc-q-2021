
input:read0 `$":input/day-02.data";
parsed:"SJ"$flip " " vs/: input;

.d2.p1:{
    dir:`forward`up`down!0 1 1;
    move:@[parsed 1; where `up = parsed 0; neg];

    :prd (@[;;+;]/)[0 0; dir parsed 0; move];
 };

.d2.p2:{
    move:@[parsed 1; where `up = parsed 0; neg];

    res:({
        idx:(2; 0) `forward = y;

        if[`forward = y;
            x[1]+:z*x 2;
        ];

        :@[x; idx; +; z];

    }/)[0 0 0; parsed 0; move];

    :prd res 0 1;
 };
