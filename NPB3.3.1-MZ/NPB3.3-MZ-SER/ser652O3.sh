#!/bin/sh

#PBS -N ser652_O3
#PBS -l walltime=01:00:00

#PBS -q mei

#PBS -l nodes=1:r652:ppn=1

module purge
module load gcc/4.9.0


/home/a78156/ESC/dstat-0.7.2/dstat -cdngym --output /home/a78156/ESC/NPB3.3.1-MZ/NPB3.3-MZ-SER/results/652/dstat_sp-mz_C_O3.csv > /dev/null & /home/a78156/ESC/NPB3.3.1-MZ/NPB3.3-MZ-SER/bin/sp-mz.C.x > /home/a78156/ESC/NPB3.3.1-MZ/NPB3.3-MZ-SER/results/652/sp-mz.C.x.O3
sleep 2
kill $!

/home/a78156/ESC/dstat-0.7.2/dstat -cdngym --output /home/a78156/ESC/NPB3.3.1-MZ/NPB3.3-MZ-SER/results/652/dstat_sp-mz_A_O3.csv > /dev/null &/home/a78156/ESC/NPB3.3.1-MZ/NPB3.3-MZ-SER/bin/sp-mz.A.x > /home/a78156/ESC/NPB3.3.1-MZ/NPB3.3-MZ-SER/results/652/sp-mz.A.x.O3
sleep 2
kill $!

