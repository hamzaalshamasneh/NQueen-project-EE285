#{
Description:
  script that runs evaulU for every single board and starting position from startPoint to specified stopPoint, in terms of dimenstions of chessboard.
  Is used to test the output of MN_next to verify that it outputs as expected for every input



Inputs:
    requres runner to change start and stop position veriables to desired values
Output
    returns the number of times that output passed and failed, along with the times it takes to execute and the retult of each test
Version:
  1.0 Original
  1.1 - addes stop and start positions for easier user experience
  1.2 - changed output to display pass and fail counts during runtime to provide more accurate information to user
  1.3 - updated output to display cordinates being etsted and improved readability with spacing
#}

## Author: Alina Matchette
## Created: 2025-05-02

startPoint = 1; #SET THESE to target start and stop dimensions
stopPoint = 11;


passcount  = 0;
failcount = 0;






for k = startPoint:stopPoint #runs loop fdor every single board and cordinate on board of MN_next
fprintf("\n\n\nTrying %d\n\n",k);
for i = 1:k
  for j = 1:k

fprintf("\n\ntrying (%d , %d)\n", i , j)
 tic
  runa =  MN_next([i j],k);

 toc
 tic
  run = evalu(runa); #checking output from MN_next in evalU
 toc
  disp(run);
  if run == "Pass" #updating pass or fail count
    passcount = passcount + 1;
   else
    failcount = failcount + 1;
  endif
  fprintf("passed %d times, failed %d times\n\n",passcount,failcount);

end
end
disp("\ndone"); #final display of passcount and failcount


end


