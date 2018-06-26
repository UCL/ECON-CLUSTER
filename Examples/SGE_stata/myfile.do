
local x : env SGE_TASK_ID
di "Running SGE_TASK_ID = `x'"
set seed `x'
insheet using recid.csv, clear 
stset durat
sample 500, count
streg  workprg priors tserved felon alcohol drugs black married educ age, distribution(weibull) nohr
esttab e(b) using "./results/task`x'.csv" , plain b nostar nomti csv replace
