This example shows how to construct a Sun Grid Engine Task Array for Stata.

To run the script:

1) In the terminal go to the directory containing this file
2) Ensure there is a folder `results`. If not type `mkdir results`.
3) Run the script by typing: `qsub runfile.sh`

The file should run 10 instances of stata on different compute nodes. The results are of each task are saved in `results` folder ready for analysis. 