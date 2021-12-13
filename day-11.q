
input:read0 `$":input/day-11.data";
parsed:"J"$/:/:input;

coords:til[count parsed] cross til count first parsed;

/ Build adajcent coordinates for each coordinate
adjs:coords!coords +/:\: (-1 0 1 cross -1 0 1) except enlist 0 0;
adjs:distinct each count[parsed] & 0 | adjs;
adjs:adjs except' enlist each coords;


.d11.p1:{
    :100 (.d11.step .)/ (0; parsed);
 };

.d11.p2:{
    allFlash:0b;
    step:0;

    state:(0; parsed);

    while[not allFlash;
        state:.d11.step . state;

        allFlash:all all 0 = last state;
        step+:1;
    ];

    :step;
 };


.d11.step:{[fc; x]
    result:x + 1;

    flashed:9 < result;
    flashAdjs:count each where each flashed ./:/: adjs;

    while[0 < count where 0 < flashAdjs;
        result:(.[;;+;]/)[result; key flashAdjs; value flashAdjs];

        extraFlash:(9 < result) & not flashed;
        flashed:flashed | extraFlash;

        flashAdjs:count each where each extraFlash ./:/: adjs;
    ];

    result:(.[;;:;0]/)[result; coords where flashed ./: coords];

    totalFlashed:count raze where each flashed;

    :(fc + totalFlashed; result);
 };

/
Day 11 Notes
------------

- Build co-ordinate list (y; x) from top left ('coords')
- Build adjacent co-ordinates for each co-ordinate ('adjs')

- For each step
  > Check for initial flashes ('9 < result') - returns a boolean grid
  > Count how many flashes surround each coordinate ('flashed ./:/: adjs')
  > Add the number of surrouding flashes to the coordinates ('.[;;+;]')
  > Check for any additional flashes, ignoring already flashed. Loop if more than 0
  > Track all flashes in 'flashed'
  > Reset all flashed values to 0 ('.[;;:;0]'), count the total number of flahses
  > Return total flashes and the current state

Part 2

  > Step until all values are zero ('all all 0 =')
