# Computer Science (CS) HPC Cluster

Below is description explaining how members of the Economics faculty can access nodes on the Computer Science's HPC Cluster.

If you need help setting up or run into problems please contact:
* support: request@cs.ucl.ac.uk
* cluster: cluster-support@cs.ucl.ac.uk
[sep queue for helpdesk questions viewable by a user: ask lars?]


## 1. Accessing the CS Cluster

Unfortunately, your UCL account cannot be used to access the CS-Cluster. To have access to the CS cluster and its graphical interfaces you will need two accounts:

* CS HPC-Cluster account: This account allows the user access the CS-HPC Cluster via SSH. Note that without special permissions, access only permitted on UCL campus.
* CS account: This is analogous to your Economics account. It gives the user access to the Computer Science's Remote Worker (CSRW), [Thinlinc](http://www.cs.ucl.ac.uk/csrw).

Formally, only the CS HPC cluster account is needed for SSH access. However, for users wanting a graphical user interface (GUI) a CS account is needed. 

At the time of writing, NX client - the graphical user interface used by the Economics department to access its HPC - is not supported. However, there are plans to support it in the near future.

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

#### What this should give you?

Once you have a CS accounts you have (external) access to:

- VPN & SHH access to CS HPC and CS supported graphical interfaces to HPC:
	- Can SSH into jet.cs.ucl.ac.uk or storm.cs.ucl.ac.uk. Do take care to enter password correctly when prompted to avoid running into anti-hacking software. If you do, note that the SSH tunnels are not jointly protected by same software. So try the other one!


_Issues to be resolved_
- There is an issue with using ISD passwords. This is why need to do this.
- CLOSING ACCOUNT: Leaving accounts... What is Econ policy?


# 2. Economics Group @ UCL within CS cluster

We have bought 240 nodes and have to around 1000 nodes. Gives us access to CS's [hardware](http://hpc.cs.ucl.ac.uk/cluster_hardware/).

## 2.1 Usage 

### How to login

	1) To SSH into the CS HPC 

```sh
ssh -X uctpXXX@vic.cs.uc.ac.uk
```

where 'uctpXXX' is a placeholder for your UCL username and 'vic' is the name of one of the nodes. There are others!
Then enter your CS password at the prompt.

	ii) Graphical User Interface/Remote Desktop through Computer Sceince Remote Worker, [Thinlinc](http://www.cs.ucl.ac.uk/index.php?id=7404) 

[add notes]


## 2.3 Software

[Add modules documentation - confirm with John whether we really want everyone to have write installation at common root]

A list of the installed software can be found in the folder './share/apps/econ'.  To load the software you will need to locate the .exe files. Once located it may be convenient to define PATH and environment variables so that the software can be easily accessed from the terminal command line. 

[Find a link to show how to do this]. 

If you want to install a programme please do so by installing it into the shared apps directory so all can access it. This folder accessible to all in Economics Dept.

## Transferring Files

[any ftp will work. Alternatively can mount on Econ storage - symmetric usage 

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

# Memory Management

See http://hpc.cs.ucl.ac.uk/memory_managment/. [Key take aways]

