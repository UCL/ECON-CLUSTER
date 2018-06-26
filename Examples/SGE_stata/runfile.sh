#Example

module load stata

#$ -S /bin/bash
#$ -N Stata-Test # <- name of the job in the qstat output
#$ -l h_vmem=2G  # <- Resource request - NECESSARY! 
#$ -l tmem=2G  	 # <- Resource request - NECESSARY! 
#$ -cwd			 # <- Tells SGE to use current working directory
#$ -t 1-10       # <- Run 10 tasks where each task has a different $SGE_TASK_ID ranging from 1 to 10

#Output the Task ID
date
hostname
echo "Message from Shell: Task ID is $SGE_TASK_ID"

# Run the stata file in batch mode 
# The stata file uses environment variable to reference the SGE_TASK_ID
# It saves outputs of a duration model for a sample of 500 observations in each task
stata -b do myfile.do

