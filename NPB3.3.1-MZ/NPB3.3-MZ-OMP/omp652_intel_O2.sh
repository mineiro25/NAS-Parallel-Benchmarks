#!/bin/sh

#PBS -N omp652_intel_O2
#PBS -l walltime=01:59:00

#PBS -q mei

#PBS -l nodes=1:r652:ppn=32

module purge
module load gcc/4.9.0
module load intel/2019

for n_procs in 2 4 8 16 32;do
	export OMP_NUM_THREADS=$n_procs
	/home/a78156/ESC/NPB3.3.1-MZ/NPB3.3-MZ-OMP/bin/sp-mz.C.x > /home/a78156/ESC/NPB3.3.1-MZ/NPB3.3-MZ-OMP/results/652/sp-mz.C_intel_O2_"$n_procs"
	sleep 2
#	kill $!

	/home/a78156/ESC/NPB3.3.1-MZ/NPB3.3-MZ-OMP/bin/sp-mz.A.x > /home/a78156/ESC/NPB3.3.1-MZ/NPB3.3-MZ-OMP/results/652/sp-mz.A_intel_O2_"$n_procs"
	sleep 2
#	kill $!
done
