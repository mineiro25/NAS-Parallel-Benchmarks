#!/bin/sh

#PBS -N omp662_O3
#PBS -l walltime=01:59:00

#PBS -q mei

#PBS -l nodes=1:r662:ppn=32

module purge
module load gcc/4.9.0

for n_procs in 2 4 8 16 32;do
	export OMP_NUM_THREADS=$n_procs
	/home/a78156/ESC/NPB3.3.1-MZ/NPB3.3-MZ-OMP/bin/sp-mz.C.x > /home/a78156/ESC/NPB3.3.1-MZ/NPB3.3-MZ-OMP/results/662/sp-mz.C_O3_"$n_procs"
	sleep 2
#	kill $!

	/home/a78156/ESC/NPB3.3.1-MZ/NPB3.3-MZ-OMP/bin/sp-mz.A.x > /home/a78156/ESC/NPB3.3.1-MZ/NPB3.3-MZ-OMP/results/662/sp-mz.A_O3_"$n_procs"
	sleep 2
#	kill $!

done
