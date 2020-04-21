#!/bin/sh

#PBS -N ser662
#PBS -l walltime=01:00:00

#PBS -q mei

#PBS -l nodes=1:r662:ppn=1

module purge
module load gcc/4.9.0


/home/a78156/ESC/dstat-0.7.2/dstat -cdngym --output /home/a78156/ESC/NPB3.3.1/NPB3.3-SER/results/662/dstat_is_C.csv > /dev/null & /home/a78156/ESC/NPB3.3.1/NPB3.3-SER/bin/is.C.x > /home/a78156/ESC/NPB3.3.1/NPB3.3-SER/results/662/is.C.x
sleep 2
kill $!

/home/a78156/ESC/dstat-0.7.2/dstat -cdngym --output /home/a78156/ESC/NPB3.3.1/NPB3.3-SER/results/662/dstat_is_A.csv > /dev/null &/home/a78156/ESC/NPB3.3.1/NPB3.3-SER/bin/is.A.x > /home/a78156/ESC/NPB3.3.1/NPB3.3-SER/results/662/is.A.x
sleep 2
kill $!
	
/home/a78156/ESC/dstat-0.7.2/dstat -cdngym --output /home/a78156/ESC/NPB3.3.1/NPB3.3-SER/results/662/dstat_ep_C.csv > /dev/null & /home/a78156/ESC/NPB3.3.1/NPB3.3-SER/bin/ep.C.x > /home/a78156/ESC/NPB3.3.1/NPB3.3-SER/results/662/ep.C.x
sleep 2
kill $!

/home/a78156/ESC/dstat-0.7.2/dstat -cdngym --output /home/a78156/ESC/NPB3.3.1/NPB3.3-SER/results/662/dstat_ep_A.csv > /dev/null & /home/a78156/ESC/NPB3.3.1/NPB3.3-SER/bin/ep.A.x > /home/a78156/ESC/NPB3.3.1/NPB3.3-SER/results/662/ep.A.x
sleep 2
kill $!

