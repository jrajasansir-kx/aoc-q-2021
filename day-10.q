
input:read0 `$":input/day-10.data";

open:"([{<";
close:")]}>";

.d10.p1:{
    points:")]}>"!3 57 1197 25137;

    :sum points .d10.parse[;0b] each input;
 };

.d10.p2:{
    incomplete:.d10.parse[;1b] each input;
    incomplete@:where 0 < count each incomplete;

    ocMap:"([{<"!")]}>";
    points:")]}>"!1 2 3 4;

    completion:reverse each ocMap incomplete;

    scores:asc ({ :y + 5*x }/) @/: points completion;
    :scores count[scores] div 2;
 };


/ Parameter 'p2' - determines what's returned:
/  - Part 1: false - just returned the syntax error
/  - Part 2: true - return the outstanding stack
.d10.parse:{[x; p2]
    it:0;
    stack:"";

    while[it < count x;
        val:x it;

        if[val in open;
            stack,:val;
        ];

        if[val in close;
            valMap:first open where val = close;

            if[not valMap = last stack;
                :(val; "") p2;
            ];

            stack:-1_ stack;
        ];

        it+:1;
    ];

    :(" "; stack) p2;
 };

/
Day 10 Notes
------------

- Build the stack out of a string, the last element is the top of the stack
- Iterate through the input and pop the stack if the element is a "close" character and it matches the top

Part 1

  - Otherwise it's a syntax error, return the invalid character
  - Return " " implying it's OK
  - Map the characters to the points ('points') and 'sum'
    - " " will map to null (as it's not present in the dictionary) so 'sum' ignores them

Part 2

  - Use the same parsing function, but modify the return - now returns the end state of the stack if valid, empty string if invalid
  - Pick entries that return a stack ('0 < count each')
  - Map the "open" characters in the stack to their "close" characters ('ocMap') and reverse the output
  - Map the characters to points ('points') and then iterate and generate the total ('/')
  - Find the middle value ('div' is integer division)
