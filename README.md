# CS Cluster

support: request@cs.ucl.ac.uk
cluster: cluster-support@cs.ucl.ac.uk
(sep queue for helpdesk questions viewable by a user: ask lars?)

1. General Econ setup
=====================

1.1 Get registered with Computer Science (CS) Dept
--------------------------------------------------

Unfortunately, cannot simply use the UCL account. So you will need a CS account to access the CS Cluster. 

What to do:

	1. Fill in a Form: Collect form from Room 4.20 in CS (/Econ Admin?). 

	The key fields to fill on the form are:

	a) UCL username
	b) Phone Contact for user
	c) Any supervisor permissions
	d) A signature agreeing to CS terms and conditions of usage.

	2. Hand in the for to CS Helpdesk in room 4.20 in Engineering building and they will setup your account. They will notify you by email when they have done so - will take between a day and a week depending on their workload.

Once you have CS account, they will set up a CS cluster account. You will then need to set the password either over the phone or in person at CS helpdesk office. 

What this should give you?
---------------------------

Once you have a CS account you have (external) access to:

- VPN & SHH access to CS HPC and CS supported graphical interfaces to HPC:
	- Can ssh into jet.cs.ucl.ac.uk or storm.cs.ucl.ac.uk. Do take care to enter password correctly when prompted to avoid running into anti-hacking software. If you do, note that the ssh tunnels are not jointly protected by same software. So try the other one!
- Computer Science Remote Worker (CSRW), Thinlinc -> http://www.cs.ucl.ac.uk/csrw. 
- At the time of writing (April 2016) NX is not yet support, but there are plans in for it to be supported in the near future.

##############################################
Notes for me
********************************************


There is an issue with using ISD passwords. This is why need to do this.
[Ask Andrew - do you have fixed IP at IFS]
[IP at my house!]
CLOSING ACCOUNT: Leaving accounts... What is Econ policy?
********************************************
##############################################



2. Economics Group @ UCL within CS cluster
==========================================

We have bought 240 nodes and have to around 1000 nodes. Gives us access to: http://hpc.cs.ucl.ac.uk/cluster_hardware/.

a) Storage: 

	i) Personal: 50GB home folder. However, this is not backed up so you may prefer to use a 'project store'.
	ii) Project Stores - these are backed up storage spaces. They can be requested from CS hpc website.  By default group writeable but can create unix groups to be more fine grained upon request (i.e. for confidentiality of data etc.)

b) Usage: 

How to login
------------

	i) To ssh into the CS HPC 

```sh
ssh -X uctp@vic.cs.uc.ac.uk
```

where 'uctpXXX' is a placeholder for your UCL username and 'vic' is the name of one of the nodes. There are others!
Then enter your CS password at the prompt.

	ii) graphical interface/remote desktop through Thinlinc: https://www.cendio.com/thinlinc/download

[add notes]

http://www.cs.ucl.ac.uk/index.php?id=7404


Software
--------

A list of the installed software can be found in the folder './share/apps/econ'.  To load the software you will need to locate the .exe files. Once located it may be convenient to define PATH and environment variables so that the software can be easily accessed from the terminal command line. 

[Find a link to show how to do this]. 

If you want to install a programme please do so by installing it into the shared apps directory so all can access it. This folder accessible to all in Economics Dept.

Transferring Files
-------------------

[any sftp will work]

Running code
------------

[You will need to learn to set PATH variables and source them at the top of job scripts. ]

pe environments
---------------

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


Example 1: Use a single node with 4 workers in parallel add the following line to you script:

```sh
#$ pe smpd 4
```

Example 2: To use a single node with 16 workers in parallel add the following line to your script:

```sh
#$ pe smpd 16
```

Note this may be slow as the programme will wait for node with enough cores to support 16 workers to be free. But it is possible. 

Example 3: To use a multiple nodes clustered on few nodes with 20 workers in parallel add the following lines to your script:

```sh
#$ pe mpich 20
#$ -R y 
```

Example 4: To use a multiple nodes clustered on few nodes with 20 workers in parallel add the following lines to your script:

```sh
#$ pe mpich 20
#$ -R y 
```

Example 4: To use a multiple CPUs arbitrarily distrbuted over a few nodes with 30 workers add the following lines to your script:

```sh
#$ pe orte 30
#$ -R y
```
[Check: do i need this line here to reserve some nodes? Seems I might.]

Also, do take a moment to review http://hpc.cs.ucl.ac.uk/cluster_etiquette/. Finally, NEVER do #$ pe mpi 1 as a 'test case' - it will crash.

[Ask John how pe julia is set up]

# Memory Management

See http://hpc.cs.ucl.ac.uk/memory_managment/. [Key take aways]

[#//#] Links below with keys