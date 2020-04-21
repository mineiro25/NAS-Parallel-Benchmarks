#!/bin/sh

#PBS -N omp662_intel
#PBS -l walltime=01:59:00

#PBS -q mei

#PBS -l nodes=1:r662:ppn=32

module purge
module load gcc/4.9.0
module load intel/2019

for n_procs in 2 4 8 16 32;do
	export OMP_NUM_THREADS=$n_procs
	/home/a78156/ESC/dstat-0.7.2/dstat -cdngym --output /home/a78156/ESC/NPB3.3.1/NPB3.3-OMP/results/662/dstat_is_C_intel_"$n_procs".csv > /dev/null &	/home/a78156/ESC/NPB3.3.1/NPB3.3-OMP/bin/is.C.x > /home/a78156/ESC/NPB3.3.1/NPB3.3-OMP/results/662/is.C_intel_"$n_procs"
	sleep 2
	kill $!

	/home/a78156/ESC/dstat-0.7.2/dstat -cdngym --output /home/a78156/ESC/NPB3.3.1/NPB3.3-OMP/results/662/dstat_is_A_intel_"$n_procs".csv > /dev/null &	/home/a78156/ESC/NPB3.3.1/NPB3.3-OMP/bin/is.A.x > /home/a78156/ESC/NPB3.3.1/NPB3.3-OMP/results/662/is.A_intel_"$n_procs"
	sleep 2
	kill $!
	
	/home/a78156/ESC/dstat-0.7.2/dstat -cdngym --output /home/a78156/ESC/NPB3.3.1/NPB3.3-OMP/results/662/dstat_ep_C_intel_"$n_procs".csv > /dev/null &	/home/a78156/ESC/NPB3.3.1/NPB3.3-OMP/bin/ep.C.x > /home/a78156/ESC/NPB3.3.1/NPB3.3-OMP/results/662/ep.C_intel_"$n_procs"
	sleep 2
	kill $!

	/home/a78156/ESC/dstat-0.7.2/dstat -cdngym --output /home/a78156/ESC/NPB3.3.1/NPB3.3-OMP/results/662/dstat_ep_A_intel_"$n_procs".csv > /dev/null &	/home/a78156/ESC/NPB3.3.1/NPB3.3-OMP/bin/ep.A.x > /home/a78156/ESC/NPB3.3.1/NPB3.3-OMP/results/662/ep.A_intel_"$n_procs"
	sleep 2
	kill $!
done
