x = ones(4);
numq =4;

#{
for i = 1:numq
  for j = 1:numq
  MN_next([i j],numq)
  disp("passed");
end
end
#}

run1 = queenElim([2 1], x);

run2 = queenElim([1 3], run1);

run3 = queenElim([3 4], run2);

run4 = queenElim([4 2], run3);

disp("MN_next out")
disp(MN_next([2 1],numq));

disp("hand queen elim out")
disp(run3);
