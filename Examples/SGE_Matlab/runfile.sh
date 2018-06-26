#Example

module load gcc/5.2.0 nag/mbl6a24dnl matlab/r2015b

#$ -S /bin/bash
#$ -l h_vmem=1.9G
#$ -l tmem=1.9G
#$ -l h_rt=360:0:0
#$ -cwd
#$ -j y

#Run 3 tasks where each task has a different $SGE_TASK_ID ranging from 1 to 3
#$ -t 1-3

#$ -N attempt
date
hostname

#Output the Task ID
echo "Task ID is $SGE_TASK_ID"

matlab -nodisplay -nodesktop -nojvm -nosplash -r "main; ID = $SGE_TASK_ID; f; exit"


