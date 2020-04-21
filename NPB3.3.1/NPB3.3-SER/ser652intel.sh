#!/bin/sh

# Introduce PBS directives

#PBS -N 652intel
#PBS -l walltime=01:59:00

#PBS -q mei

#PBS -l nodes=1:r652:ppn=1

# Regular script to execute jobs

module purge

# intel compiler loaded
module load gcc/4.9.0


# Intel compiler loaded
module load intel/2013.1.117
source /share/apps/intel/compilers_and_libraries_2017/linux/bin/compilervars.sh intel64


/home/a78156/ESC/dstat-0.7.2/dstat -cdngym --output /home/a78156/ESC/NPB3.3.1/NPB3.3-SER/results/652/dstat_is_C_intel.csv > /dev/null & /home/a78156/ESC/NPB3.3.1/NPB3.3-SER/bin/is.C.x > /home/a78156/ESC/NPB3.3.1/NPB3.3-SER/results/652/is.C.x.intel
sleep 2
kill $!

/home/a78156/ESC/dstat-0.7.2/dstat -cdngym --output /home/a78156/ESC/NPB3.3.1/NPB3.3-SER/results/652/dstat_is_A_intel.csv > /dev/null & /home/a78156/ESC/NPB3.3.1/NPB3.3-SER/bin/is.A.x > /home/a78156/ESC/NPB3.3.1/NPB3.3-SER/results/652/is.A.x.intel
sleep 2
kill $!

/home/a78156/ESC/dstat-0.7.2/dstat -cdngym --output /home/a78156/ESC/NPB3.3.1/NPB3.3-SER/results/652/dstat_ep_C_intel.csv > /dev/null & /home/a78156/ESC/NPB3.3.1/NPB3.3-SER/bin/ep.C.x > /home/a78156/ESC/NPB3.3.1/NPB3.3-SER/results/652/ep.C.x.intel
sleep 2
kill $!

/home/a78156/ESC/dstat-0.7.2/dstat -cdngym --output /home/a78156/ESC/NPB3.3.1/NPB3.3-SER/results/652/dstat_ep_A_intel.csv > /dev/null & /home/a78156/ESC/NPB3.3.1/NPB3.3-SER/bin/ep.A.x > /home/a78156/ESC/NPB3.3.1/NPB3.3-SER/results/652/ep.A.x.intel
sleep 2
kill $!


