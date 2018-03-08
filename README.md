# Computer Science (CS) High-Performance Cluster (HPC)

Through the CS HPC the Economics Deparmtent has access to over 1000 [nodes](http://hpc.cs.ucl.ac.uk/cluster_hardware/).

Below is description explaining of how members of the Economics faculty can access nodes on the CS clsuter.

If you need help setting up or run into problems please contact CS support: cluster-support@cs.ucl.ac.uk.

Throughout this document there are links to help pages hosted by the CS department. These pages are password protected. To view them you must obtain the username and password either from cluster-support@cs.ucl.ac.uk or from economics.it@ucl.ac.uk.

## 1. Accessing the CS HPC

Like the Economics department, the CS department has two types of account - a departmental account and a HPC account. 

### 1.1 Getting registered with Computer Science (CS) Dept

To get a CS department account: 

  1. Fill in a Registration Form: Collect a form from Room 4.20 in CS dept or directly from Fatima in Economics IT. The key fields to fill on the form are:
    + UCL username
    + Phone Contact for user
    + Any supervisor permissions
    + A signature agreeing to CS terms and conditions of usage.

  2. Hand in the form to CS Helpdesk in room 4.20 in Engineering building and they will setup your account. The CS team will notify you by email when they have done so. This may take between a day and a week depending on their workload.

Once you have CS account, the CS department will automatically set up a CS cluster account for you. It will have the same user name and password by default.

You can reset the password either over the phone or in person at CS helpdesk office. 

# 2. Connecting to the CS cluster

Connecting to the CS cluster is a two step process. 

1. Log in to the CS department computing system using your CS department account
2. Once inside, connect to the CS cluster using your CS cluster account. 

Sections 2.1 and 2.2 below discuss these steps in turn.

## 2.1. Log in to the CS department computing system

There are two different ways to do step 1 and log into the Computer Science system:

1. Log in and open a remote desktop session on the CS cluster using Computer Science Remote Worker (CSRW), ThinLinc 
2. `ssh` in from your terminal

Each is discussed in more detail below.

### 2.1.1. Remote Desktop Session - CSRW, ThinLinc

To use start a 'remote desktop' session, use the Computer Science Remote Worker (CSRW). 

To use the CSRW uses a program called ThinLinc. Download and use instructions for the CS department's can be found [here](http://www.cs.ucl.ac.uk/index.php?id=7404).

Once downloaded ThinLinc for operating system, you will need your CS department account to log in. 

To log in, open the ThinLinc application and enter you username and password from your CS departmental account. The next step is to access the CS cluster are described in section 2.2.

## 2.1.2. Accessing the CS cluster through a terminal

The other option is to `ssh` into the CS computing system at the command line by logging into `tails`. To do this, at the command line type:

```sh
ssh -X uctpXXX@tails.cs.ucl.ac.uk
```

where

* The option `-X` allows graphics to be forwarded from the CS cluster to your computer.
* The username "uctpXXX" is that given when you are assigned your CS account.
* The text after the `@` is the address of the server.

After you type the command, the server will ask for a password. The password should be your CS department account password.

## 2.2. Accessing the CS cluster from within CS department computing system

At this point you have logged into the CS department's computing system using either CSRW as described in 2.1.1 or via `ssh` as described in 2.1.2. The next step is to log onto the CS cluster.

You can do this using you username and password for your **CS cluster account**.

If you accessed the computer network through ThinLinc, open a terminal (i.e. from the Applications drop down menu). If you have `ssh`'d directly into `tails` continue at the command prompt.

Then, to log into the CS cluster via the `vic` log on node, at the command line prompt type:

```sh
ssh -X uctpXXX@vic.cs.ucl.ac.uk
```

Alternatively, to log into the CS cluster via the `wise` log on node, at the command line prompt type:

```sh
ssh -X uctpXXX@wise.cs.ucl.ac.uk
```

There are several different log on nodes, but for your purposes one of `vic` or `wise` should suffice (i.e. if you can't log on to one for some reason, then try the other).

# 3. General Information about the CS HPC

## 3.1 Storage

The storage of files is quite different to the setup on the Economics HPC. 

### 3.1.1. Saving files and making directories

While it is possible to make directories and save files in your home directory on the CS HPC it is important to note that these files **are not backed up**.

The CS department offer backed up storage areas called **project stores**. Unlike your home directories, project stores are designed to handle intensive reading and writing of files during cluster jobs.

Project stores are allocated to individual users and/or multiple user groups on request. To **request a project store** fill in the online [storage request form](http://hpc.cs.ucl.ac.uk/file_systems_storage/cluster_storage_request_form/cluster_storage_request_sent/).

### 3.1.2. Accessing existing files on Economics Dept Server

On the Economics HPC it was possible to directly access files saved on the Economics department server. At the time of writing, this is not possible on the CS HPC. Therefore, if you want to access these files on the CS HPC you will have to transfer them using a SFTP clients (see section 4). 

Ideally, you should transfer these files to a project store.

## 3.2. Software licenses

See [Economics Wiki](https://www.econ.ucl.ac.uk/wiki/index.php/General_system_information)

# 4.  Transferring Files to and from the CS HPC

Any SFTP service can be used to transfer files to and from the CS HPC. Popular SFTP include [WinSCP](https://winscp.net/eng/index.php) or [FileZilla](https://filezilla-project.org/)

# 3. Accessing compute nodes: Sun Grid Engine

To ensure your jobs run as quickly as possible the cluster uses the Sun Grid Engine© (SGE) solution to keep track of what resources are available. Depending on the load, the jobs you submit will either be instantly scheduled to a compute node or placed in a queue until the resources requested become available.

There are two types of sessions

## 5.1. Interactive sessions

This section covers how to submit an interactive sessions along with examples of how to decide when it may be best to use this type of session.

The CS department request that users specify options to limit memory and time logged in when logging onto the CS HPC using an interactive session. As such, to open an interactive session from your terminal once you have logged into the CS HPC, type:

```sh
qrsh -l h_vmem=1.9G, tmem=1.9G, h_rt=8:0:0
```

This will log you into an available node for 8hrs and allow you to use 1.9G of memory. In more detail:

- `qrsh` is an alternative interactive session login command
- `-l` is a flag for resource requests of the interactive session
- The resource options listed afted the `-l` flag:
	+ `h_vmem=XG, tmem=XG` requests X Gb of memory 
	+ `h_rt= H:M:S` request that the session run for `H` hours, `M` minutes, `S` seconds

_Note 1: From the user's persepective the `qrsh` command is an alternative to `qlogin` command currently used on the Economics HPC._

_Note 2: Unlike the Economics HPC there is no distinction between a batch queue and an interactive session queue._

## 5.2. Non-interactive sessions

This section covers how to submit an interactive sessions along with examples of how to decide when it may be best to use this type of session.

A detailed discussion of how to submit batch jobs with many useful the SGE options can be found on the [Economics Wiki](https://www.econ.ucl.ac.uk/wiki/index.php/Non-interactive_sessions).

In addition, like an interactive session, you will have to add lines specifying hard run time and memory requirements. For example, if you submit a a qsub using a shell script you must add:

```sh
#$ -l h_rt=1:10:35  # This line specifies run time of 1 hour, 10 mins and 35 seconds
#$ -l tmem=1.9G, h_vmem=1.9G # This specifies 1.9 Gigabytes (can also specify M for Megabytes of k for kilobytes)
```

The job will run without it if omitted, but with restrictive defaults applied. The defaults are:

```sh
#$ -l h_rt=0:0:30  # 30 mins is default hard run time
#$ -l tmem=256M, h_vmem=256M # Default is 256MB
```

_Note: Users who specify a parallel environment in their submission script please do see section 5.5 for details of parallel environments on the CS HPC._

## 5.3. Checking the status of your jobs

This section shows you how to check the current status of your jobs and the SGE queues. See the [Econ Wiki](https://www.econ.ucl.ac.uk/wiki/index.php/Checking_the_status_of_your_jobs).

Note that `qstat-rn` command is specific to the Economics HPC and is only available on the CS HPC if you have added the `econutils` module to your session. Note that you can do this by adding:

```sh
module load econutils
```

to your `.bashrc` profile or the command line.

## 5.4. Deleting jobs

To delete job with job number 123456 type:

```sh
qdel 123456
```

## 5.5. SGE Parallel Environments

If you wish to control the parallel environment used by your cluster job there are several parallel environments on the CS HPC:

- `smp`: single node with multiple workers
- `matlabpe2014b`: parallel environment specific to Matlab. CS only support b release each year. Matlab 2015b is yet to be supported.
- `mpi`: Old MPI interface
- `mpich`: New MPI interface
- `orte`: Distributed computing across nodes that clusters are grouped on nodes
- `para`: Distributed computing across nodes across nodes. 

If no parallel environment is specified, the default is `orte`.

Those using the `julia` parallel environment on the Economics HPC should specify `orte` or `para` depending on how you want to instantiate workers.

#### Specifying a parallel environment

To specify a the parallel environment used by your cluster job add the following lines to your script. Note the second line is only necessary when using more than one node i.e. default is Default is `#$ -R n`.

```sh
#$ pe [pe_option]::ASCIIString NumWorkers::Int  # <- SGE option for parallel environment
#$ -R y                                         # <- Resource reservation. Useful when lots of memory and/or multiple nodes requested. 
```

Below are some example of lines to add to submission scripts.

**Example 1**: Use a single node with 4 workers in parallel add the following line to you script:

```sh
#$ pe smpd 4
```

**Example 2**: To use a single node with 16 workers in parallel add the following line to your script:

```sh
#$ pe smpd 16
```

_Note this may be slow as the programme will wait for node with enough cores to support 16 workers to be free. But it is possible._

**Example 3**: To use a multiple nodes clustered on few nodes with 20 workers in parallel add the following lines to your script:

```sh
#$ pe orte 20
#$ -R y 
```

**Example 4**: To use a multiple CPUs arbitrarily distrbuted over nodes with 30 workers add the following lines to your script:

```sh
#$ pe para 30
#$ -R y
```

# 6. Accessing Software

Once logged on to a compute node, to access software you can use the [modules environment](https://www.econ.ucl.ac.uk/wiki/index.php/The_Module_Environment). 

To see the list of software currently available to load type:

```sh
module avail
```

The following software is currently available via a module and is stored in `./share/apps/econ`:

```sh
[uctXXXX@vic ~]$ module avail

----------------- /share/apps/econ/Modules/3.2.10/modulefiles -----------------
dot                       matlab/r2012b             nag/mbl6a24dnl
econutils                 matlab/r2013b             openmpi/gcc/1.10.0
gcc/5.2.0                 matlab/r2014a             openmpi/gcc/1.8.1
git/2.8.3                 matlab/r2014b             openmpi/intel/1.10.0
intel/composer/2013.1.117 matlab/r2015b             openmpi/intel/1.8.1
intel/composer/2015.1.133 module-info               stata/14
julia/0.4.5               modules                   use.own
knitro/10.0.1-z           nag/mbl6a23dml
```

Unfortunately, we are still working on developing symmetric functionality for the CS HPC as the Economics HPC. In particular, there are some important differences for users migrating from the Economics HPC:

#### a. Loading modules requires more verbose commands

For example, typing `matlab` on the Economics HPC in an interactive session calls a script which automatically loads the MATLAB together with any dependencies. However, on the CS HPC the user must load software listing dependencies. For example, to load MATLAB r2015b the user must type:

```sh
module load gcc/5.2.0 nag/mbl6a24dnl matlab/r2015b
```

## 6.2. Loading Software

Below are some details on loading some of the most commonly used programs.

### 6.2.1. MATLAB

To load MATLAB run a command from the list below that corresponds to the version you wish to load.

```sh
module load gcc/5.2.0 nag/mbl6a24dnl matlab/r2015b
module load gcc/5.2.0 nag/mbl6a24dnl matlab/r2014b
module load gcc/5.2.0 nag/mbl6a24dnl matlab/r2014a
module load gcc/5.2.0 nag/mbl6a24dnl matlab/r2013b
module load nag/mbl6a23dml matlab/r2012b
```

If you have logged onto the CSRW and have opened a terminal and ssh'd into a head node (i.e. jake or elwood), then these commands will launch MATLAB's.

[Add x-forwarding comment]

## 6.2.2. Stata

To load (command line only) Stata-MP

```sh
module load stata
stata-mp
```

If you have logged onto the CSRW and have opened a terminal and ssh'd into a head node (i.e. jake or elwood), then you can launch Stata's GUI as follows:

```sh
module load stata
xstata-mp
```

### 6.2.3. Julia

To open Julia type

```sh
module load git/2.8.3 julia
julia
```
_Note: you will need git to manage packages_

In order to use Julia's packages you will need to change the default location of you package directory (or repository) to a project store (see section 3). This is because your home drive, the default location for Julia to store its packages, has file number limit that Julia may hit when it install packages. 

The easiest way to manually control the location of your package directory is to to add the following lines to your `.bash_profile`.

```sh
JULIA_PKGDIR=[PATH_TO_PKGDIR]
export JULIA_PKGDIR
```

Then reload your `.bash_profile`

```sh
source ~/.bash_profile
```

Then, open Julia and check that your package directory has changed and initialize it. That is, in Julia type:

```julia
Pkg.dir() # Returns the path of you package directory
Pkg.init() # Initializes the package directory
```

_Note: You only need initialize the package directory it once._

### 6.2.4. Fortran

For an example demonstrating how to run Fortran [this example](https://wiki.ucl.ac.uk/pages/viewpage.action?title=CS+Cluster&spaceKey=~uctpln0#CSCluster-Fortran)

# 7. Policies and Best Practices

## 7.1 Cluster Etiquette

[CS department cluster etiquette](http://hpc.cs.ucl.ac.uk/cluster_etiquette/)

## 7.2 Memory Management

Please think about your job's memory usage.

In order for us to make best use of the cluster, we now require you to submit your expected memory usage when you submit a job (if you leave this out, your job will not run).

If your job goes over this requested limit, it will be automatically killed.  The more memory you request, the longer your job will wait in the queue. Only request what you think you need.

To request x GB of memory: 

```sh
-l h_vmem=xG , tmem=xG
```

to your `qsub` command. Or, alternatively, add the following line to your `qsub` script:

```sh
#$ -l h_vmem=xG,tmem=xG
```
  
Most nodes have between 2 and 8GB per core.  The physical machines vary from 4GB to 1TB, but if you want to run a job requiring more than 47.2GB please contact request@cs.ucl.ac.uk.

For the best job throughput please request less than 1.9G. That is:

```sh
-l tmem=1.9G,h_vmem=1.9G
```

There are only a few machines with more than 64GB of memory. If you request more than 8G you will probably need to add a resource reservation to your job, unless the cluster is very empty.

To add resource reservation to your qsub command add:
```sh
-R y
```
or in your qsub script, add:
```sh
#$ -R y
```

* Although machines have 8, 16, 24, 48, 96, 128, 256 and 1TB of memory, in reality this translates into requestable memory of 7.9, 15.7, 23.5, 62.9, 47.2, 94.4GB. i.e. if you request 16G you will not be able to run on any of the 16G machines and your job will queue for longer.

* Also note in a parallel environment, the amount you request is the `h_vmem` and `tmem` multiplied by the number of cpu's you request.

See [link](http://hpc.cs.ucl.ac.uk/memory_managment/) for more details.

