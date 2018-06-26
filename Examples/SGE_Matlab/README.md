This example shows how to construct a Sun Grid Engine Task Array for a MATLAB function.

## Submission of non-interactive MATLAB Task Array Job

To submit the job set the current directory to one containing this file and type on the terminal

`qsub runfile.sh`

## Details of code

For reference, the steps encoded in the script are as follows:

1) Run the script main.m once. The script main.m produces the matrices "A" and "grid". 

2) After the the matrices "A" and "grid" are generated, we run the script f.m 3 times. 

The script f.m loads the matrices "A" and "grid" and calls the function myfunc.m. 

The function myfunc.m uses the matrix "A" and some rows (depending on the iteration id) of the matrix "grid" to generate a matrix called "result" which is then saved.



