
input:read0 `$":input/day-04.data";

draw:"J"$"," vs first input;

boards:("J"$" " vs/: 1_ input) except\: 0N;
boards:1_/:(where 0 = count each boards) cut boards;

.d4.p1:{
    res:draw?boards,'flip each boards;
    maxDraw:max@/:/: res;

    winMax:min min each maxDraw;
    winner:first where winMax in/: maxDraw;

    :draw[winMax] * sum raze[boards winner] except (winMax + 1)#draw;
 };

.d4.p2:{
    res:draw?boards,'flip each boards;
    maxDraw:max@/:/: res;

    lastWinMax:max min each maxDraw;
    lastWinner:first where lastWinMax = first each asc each maxDraw;

    :draw[lastWinMax] * sum raze[boards lastWinner] except (lastWinMax + 1)#draw;
 };

/
Day 4 Notes
-----------

- Reverse the game - find ('?') at which point in the draw each number in the board will occur
- Append the 'flip' of each board to track column matches
- Find the row / column which has the smallest maximum draw index (first to win)
- Use that index to:
  - draw the numbers ('#')
  - flatten the board sturcure ('raze')
  - exclude them from each row of the board ('except') (+1 to get the winning number)

Part 2:

  - 'lastWinner' has to take into account that a board may already have won
    - sort the maximums and only take the first time a board wins
