Copyright (c) 2016 Vidhya
# TowerOfHanoi




To run the iterative version of tower of hanoi, in the command line, type:
$ clisp iterth.lisp
This would ask you to enter the number of disks you want to start with. Enter the number. For e.g.:

Enter the number of disks: 3

After this, the program would print the contents of the three stacks (or poles) as stack1, stack2 and stack3.
stack1 is the initial (source) pole and stack2 corresponds to the destination pole.


To run the recursive version of tower of hanoi, in the command line, type:
$ clisp recth.lisp
This would ask you to enter the number of disks you want to start with. Enter the number. For e.g.:

Enter the number of disks: 3

After this, the program would print the contents of the three stacks (or poles) as stack1, stack2 and stack3.
stack1 is the initial (source) pole and stack2 corresponds to the destination pole.

The iterative version of the program (iterth.h) ran for about 16 mins for 22 disks and 32 mins for 23 disks.
The recursive version of the program (recth.h) ran for about 15 mins for 22 disks and 31 mins for 23 disks.
