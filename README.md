# Computer Science (CS) HPC Cluster

Through the CS HPC Cluster the Economics Deparmtent has access to over 1000 nodes.

- [hardware](http://hpc.cs.ucl.ac.uk/cluster_hardware/)

Below is description explaining of how members of the Economics faculty can access nodes on the Computer Science's HPC Cluster.

If you need help setting up or run into problems please contact:

* CS support: cluster-support@cs.ucl.ac.uk

[Request more memory etc -> CS requests: request@cs.ucl.ac.uk]

## 1. Accessing the CS Cluster

Like the Economics department, the CS department has two types of account - a departmental account and a HPC account. 

If you only require command line access to the CS HPC, you only need a CS HPC account to gain access via SSH. If, however, you wish to access the CS HPC through a graphical user interface (i.e. remote desktop) you will need both a CS departmental account and a CS HPC account. 

This is because the CS HPC graphical interface, the [Computer Science Remote Worker](http://www.cs.ucl.ac.uk/csrw) (CSRW), requires a CS departmental account to use it (see section XX below for more details on CSRW).

Note that the CS HPC can only be accessed from the UCL campus. If you would like access from outside UCL you will need contact the CS support team (see section XX for more details).

### 1.1 Getting registered with Computer Science (CS) Dept

What to do:

	1. Fill in a Registration Form: Collect form from Room 4.20 in CS (/Econ Admin?). 

	The key fields to fill on the form are:

	a) UCL username
	b) Phone Contact for user
	c) Any supervisor permissions
	d) A signature agreeing to CS terms and conditions of usage.

	2. Hand in the for to CS Helpdesk in room 4.20 in Engineering building and they will setup your account. They will notify you by email when they have done so - will take between a day and a week depending on their workload.

Once you have CS account, they will set up a CS cluster account. You will then need to set the password either over the phone or in person at CS helpdesk office. 

To only apply for a CS cluster account fill in this online [form](http://hpc.cs.ucl.ac.uk/account_application_form/).

# 2. Connecting to the Cluster

## 2.1. Graphical User Interface (GUI) - CSRW, Thinlinc

Graphical User Interface/Remote Desktop through Computer Sceince Remote Worker, [Thinlinc](http://www.cs.ucl.ac.uk/index.php?id=7404) 

[add notes]

At the time of writing, NX client - the graphical user interface used by the Economics department to access its HPC - is not supported. However, there are plans to support it in the near future.

## 2.2. Terminal Access

To login, first open a terminal window. Then logon using ssh as follows. The option -X allows for graphic x-windows to be forwarded from the cluster to your computer.

```sh
ssh -X uctpXXX@vic.cs.ucl.ac.uk
```

where 
* The option -X allows graphics to be forwarded form the cluster to your computer.
* The username "uctpXXX" is the name of the user. The username should be your UCL username
* The text after the @ is the address of the server.
After you type the command, the server will ask for a password. The password should be your you CS Cluster Account Password.

CS-HPC login nodes for Econ department:

* wise.cs.ucl.ac.uk
* vic.ucl.cs.ac.uk

If you are using How to log in from 

- [Windows](http://hpc.cs.ucl.ac.uk/cluster_for_dummies/logging_in_from_windows/)
- [Mac OSX](http://hpc.cs.ucl.ac.uk/cluster_for_dummies/logging_in_from_mac/)
- [Linux](http://hpc.cs.ucl.ac.uk/cluster_for_dummies/logging_in_from_linux/)

	1) To SSH into the CS HPC 

```sh
ssh -X uctpXXX@vic.cs.uc.ac.uk
```

where 'uctpXXX' is a placeholder for your UCL username and 'vic' is the name of one of the nodes. There are others!
Then enter your CS password at the prompt.

# 3. General Information about the cluster

- Queues
- Parallel Environments
- Storage
- Software licenses


# 4.  Tranfserring Files to and from the CS Cluster

SFTP: WinSCP or FileZilla

- Project Stores
	+ See my notes

- Mount SAN -> this needs to be discussed and finalised. Seems likely will need to mount econ server on CS

# 5. The Module Environment

Symmetric 

But note Stata & MATLAB

[Add modules documentation - confirm with John whether we really want everyone to have write installation at common root]

A list of the installed software can be found in the folder './share/apps/econ'.  To load the software you will need to locate the .exe files. Once located it may be convenient to define PATH and environment variables so that the software can be easily accessed from the terminal command line. 

[Find a link to show how to do this]. 

If you want to install a programme please do so by installing it into the shared apps directory so all can access it. This folder accessible to all in Economics Dept.

# 6. Sun Grid Engine

To ensure your jobs run as quickly as possible the cluster uses the Sun Grid Engine© (SGE) solution to keep track of what resources are avaialble. Depending on the load, the jobs you submit will either be instantly scheduled to a compute node or placed in a queue until the resources requested become available.

## 6.1. Interactive sessions

This section covers how to submit an interactive sessions along with examples of how to decide when it may be best to use this type of session.

[Note -> This is a difference between ECON HPC and CS HPC. qrsh. CS not keen on this - should check if some additional restrictions.]

From CS website: If you absolutely insist on using an interactive session:

From your terminal once you have logged into the CS HPC Cluster:

```sh
qrsh -l h_vmem=8G,tmem=8G,h_rt=8:0:0
```

This will log you into an available node for 8hrs and allow you to use 8G of memory.


## 6.2. Non-interactive sessions

This section covers how to submit an interactive sessions along with examples of how to decide when it may be best to use this type of session.

[Question for JM: Are we porting over econutils modules to cluster?]

[See Econ Wiki](https://www.econ.ucl.ac.uk/wiki/index.php/Non-interactive_sessions)

[CS specific requirements](http://hpc.cs.ucl.ac.uk/job_submission_sge/basic_sge_submission/)

## 6.3. Checking the status of your jobs

This section shows you how to check the current status of your jobs and the SGE queues.

## 6.4. Deleting jobs

This section shows you how to remove unwanted jobs from the SGE queues.

# 7. Applications

I am not sure this is the most useful page in the world on Econ Wiki

# 8. Policies and Best Practices

[CS department cluster etiquette](http://hpc.cs.ucl.ac.uk/cluster_etiquette/)


## Running code

[You will need to learn to set PATH variables and source them at the top of job scripts. ]

-> I probably want an example here ... 

## Parallel environment (pe)

Add the following lines to your script to set up a parallel environment. Note the second line is only necessary when using more than one node i.e. default is Default is #$ -R n.

```sh
#$ pe [pe_option]::ASCIIString NumWorkers::Int 	# <- SGE option for parallel environment
#$ -R y 										# <- Resource reservation. Useful when lots of memory and/or multiple nodes requested. 
```
where pe_option can be one of:

- smpd: single node with multiple workers. 
- matlab2014b: parallel environment specific to Matlab. Note: CS only support b release each year.
- mpi: Old MPI interface
- mpich: New MPI interface
- orte: Distributed computing across nodes without attempting to cluster on a given node. Can be much faster than mpich [To be tested!]


*Example 1: Use a single node with 4 workers in parallel add the following line to you script:

```sh
#$ pe smpd 4
```

*Example 2: To use a single node with 16 workers in parallel add the following line to your script:

```sh
#$ pe smpd 16
```

Note this may be slow as the programme will wait for node with enough cores to support 16 workers to be free. But it is possible. 

*Example 3: To use a multiple nodes clustered on few nodes with 20 workers in parallel add the following lines to your script:

```sh
#$ pe mpich 20
#$ -R y 
```

*Example 4: To use a multiple nodes clustered on few nodes with 20 workers in parallel add the following lines to your script:

```sh
#$ pe mpich 20
#$ -R y 
```

*Example 5: To use a multiple CPUs arbitrarily distrbuted over a few nodes with 30 workers add the following lines to your script:

```sh
#$ pe orte 30
#$ -R y
```
[Check: do i need this line here to reserve some nodes? Seems I might.]

Also, do take a moment to review http://hpc.cs.ucl.ac.uk/cluster_etiquette/. Finally, NEVER do:

```sh
#$ pe mpi 1 
```

as a 'test case' - it will crash!!!

[Ask John how pe julia is set up - update with my notes]

## Memory Management

Please think about your job's memory usage.

In order for us to make best use of the cluster, we now require you to submit your expected memory usage when you submit a job (if you leave this out, your job will not run).

If your job goes over this requested limit, it will be automatically killed.  The more memory you request, the longer your job will wait in the queue. Only request what you think you need.

To do this, either add BOTH: 

```sh
-l h_vmem=xG
-l tmem=xG
```

or

```sh
-l h_vmem=xM, tmem=xM
```

Alternatively to your qsub command or in your qsub script add:

```sh
#$ -l h_vmem=xG,tmem=xG
```
  
Most nodes have between 2 and 8GB per core.  The physical machines vary from 4GB to 1TB, but if you want to run a job requiring more than 47.2GB please contact request@cs.ucl.ac.uk.

For the best job throughput please request less than 1.9G.

```sh
-l tmem=1.9G,h_vmem=1.9G
```

There are only a few machines with more than 64GB of memory. If you request more than 8G you will probably need to add a resource reservation to your job, unless the cluster is very empty.

To add resource reservation to a job add:
```sh
-R y
```
to your qsub or in your qsub script, add:
```sh
#$ -R y
```


* Although machines have 8,16,24,48,96,128,256 and 1TB of memory, in reality this translates into requestable memory of 7.9,15.7,23.5,62.9,47.2,94.4GB. ie if you request 16G you will not be able to run on any of the 16G machines and your job will queue for longer.

** Also note in a parallel environment, the amount you request is the h_vmem and tmem multiplied by the number of cpu's you request.

See http://hpc.cs.ucl.ac.uk/memory_managment/. [Key take aways]

