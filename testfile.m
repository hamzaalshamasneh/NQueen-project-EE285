x = ones(8);


run1 = (queenElim([5,3],x));

run2 = (queenElim([8,8],run1));
run3 = (queenElim([8,8],run2));



disp(run1);
disp("break");
disp(run2);
disp("break");
disp(run3);
