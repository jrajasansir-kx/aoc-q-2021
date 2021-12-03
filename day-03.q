
input:read0 `$":input/day-03.data";
parsed:"B"$/:/:input;

.d3.p1:{
    counts:count@/:/:group each flip parsed;
    gammaBin:raze where each counts =' max@/:counts;

    gamma:0b sv ((32 - count gammaBin)#0b),gammaBin;
    epsilon:0b sv ((32 - count gammaBin)#0b),not gammaBin;

    :gamma * epsilon;
 };

.d3.p2:{
    o2idx:first (.d3.find[;;max])/[til count parsed; flip parsed];
    c02idx:first (.d3.find[;;min])/[til count parsed; flip parsed];

    :prd 0b sv/: ((32 - count first parsed)#0b),/:parsed o2idx,c02idx;
 };

.d3.find:{[idx; bits; minmax]
    remain:bits idx;
    rc:count each group remain;

    match:first ((asc; desc) max = minmax) where rc = minmax rc;

    newIdx:idx where match = remain;
    :newIdx;
 };


/
Day 3 Notes
-----------

- Converting input to list of boolean lists ("B"$) is used to represent bytes
- Lists need to be padded to 32-bits (prepend 0b) to convert to integer (0b sv)
- Input is 'flip'ed before processing to give us lists of each bit position

Part 1:

  - 'group' gives indices for each distinct element in the list
 
Part 2:

  - '/' provides iteration over the bits for each bit position
  - All indices valid at the start ('til count')
  - .d3.find
    - idx: The indices still valid
    - bits: The bits of the current bit position
    - minmax: Are we looking for the max (o2) or min (c02) occurance
      - sort the result based on 'minmax' so 'first' gives us the correct result in case of tie

