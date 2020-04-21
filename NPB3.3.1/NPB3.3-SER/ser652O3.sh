#!/bin/sh

#PBS -N ser652_O3
#PBS -l walltime=01:00:00

#PBS -q mei

#PBS -l nodes=1:r652:ppn=1

module purge
module load gcc/4.9.0


/home/a78156/ESC/dstat-0.7.2/dstat -cdngym --output /home/a78156/ESC/NPB3.3.1/NPB3.3-SER/results/652/dstat_is_C_O3.csv > /dev/null & /home/a78156/ESC/NPB3.3.1/NPB3.3-SER/bin/is.C.x > /home/a78156/ESC/NPB3.3.1/NPB3.3-SER/results/652/is.C.x.O3
sleep 2
kill $!

/home/a78156/ESC/dstat-0.7.2/dstat -cdngym --output /home/a78156/ESC/NPB3.3.1/NPB3.3-SER/results/652/dstat_is_A_O3.csv > /dev/null &/home/a78156/ESC/NPB3.3.1/NPB3.3-SER/bin/is.A.x > /home/a78156/ESC/NPB3.3.1/NPB3.3-SER/results/652/is.A.x.O3
sleep 2
kill $!
	
/home/a78156/ESC/dstat-0.7.2/dstat -cdngym --output /home/a78156/ESC/NPB3.3.1/NPB3.3-SER/results/652/dstat_ep_C_O3.csv > /dev/null & /home/a78156/ESC/NPB3.3.1/NPB3.3-SER/bin/ep.C.x > /home/a78156/ESC/NPB3.3.1/NPB3.3-SER/results/652/ep.C.x.O3
sleep 2
kill $!

/home/a78156/ESC/dstat-0.7.2/dstat -cdngym --output /home/a78156/ESC/NPB3.3.1/NPB3.3-SER/results/652/dstat_ep_A_O3.csv > /dev/null & /home/a78156/ESC/NPB3.3.1/NPB3.3-SER/bin/ep.A.x > /home/a78156/ESC/NPB3.3.1/NPB3.3-SER/results/652/ep.A.x.O3
sleep 2
kill $!

