#!/bin/sh

# Introduce PBS directives

#PBS -N 652intel_O2
#PBS -l walltime=01:59:00

#PBS -q mei

#PBS -l nodes=1:r652:ppn=1

# Regular script to execute jobs

module purge

# intel compiler loaded
module load gcc/4.9.0


# Intel compiler loaded
module load intel/2019


/home/a78156/ESC/dstat-0.7.2/dstat -cdngym --output /home/a78156/ESC/NPB3.3.1-MZ/NPB3.3-MZ-SER/results/652/dstat_sp-mz_C_intel_O2.csv > /dev/null & /home/a78156/ESC/NPB3.3.1-MZ/NPB3.3-MZ-SER/bin/sp-mz.C.x > /home/a78156/ESC/NPB3.3.1-MZ/NPB3.3-MZ-SER/results/652/sp-mz.C.x.intel_O2
sleep 2
kill $!

/home/a78156/ESC/dstat-0.7.2/dstat -cdngym --output /home/a78156/ESC/NPB3.3.1-MZ/NPB3.3-MZ-SER/results/652/dstat_sp-mz_A_intel_O2.csv > /dev/null & /home/a78156/ESC/NPB3.3.1-MZ/NPB3.3-MZ-SER/bin/sp-mz.A.x > /home/a78156/ESC/NPB3.3.1-MZ/NPB3.3-MZ-SER/results/652/sp-mz.A.x.intel_O2
sleep 2
kill $!


