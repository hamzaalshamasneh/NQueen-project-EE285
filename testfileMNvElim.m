x = ones(4);


passcount  = 0;
failcount = 0;

for k = 11:14
fprintf("\n\n\nTrying %d\n\n",k);
for i = 1:k
  for j = 1:k


 tic
  runa =  MN_next([i j],k);
 toc
  run = evalu(runa);

  disp(run);
  if run = "Pass"
    passcount = passcount + 1;
   else
    failcount = failcount + 1;
  endif


end
end
disp("\ndone");

fprintf("passed %d times, failed %d times",passcount,failcount);
end
#run = MN_next([1 1],numq);


