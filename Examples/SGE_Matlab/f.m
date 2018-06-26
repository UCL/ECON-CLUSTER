load matrices
%select 2 rows of the matrix grid: task m selects rows 2*(m-1)+1: m*2
sgetasknum = grid(2*(str2double(getenv('SGE_TASK_ID'))-1)+1: str2double(getenv('SGE_TASK_ID'))*2,:); %2x2 
result = myfunc(sgetasknum, A);

filename = sprintf('Result.%d.mat', ID);
save(filename, 'result')

