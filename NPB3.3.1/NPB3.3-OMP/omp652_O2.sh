#!/bin/sh

#PBS -N omp652_O2
#PBS -l walltime=01:59:00

#PBS -q mei

#PBS -l nodes=1:r652:ppn=32

module purge
module load gcc/4.9.0

for n_procs in 2 4 8 16 32;do
	export OMP_NUM_THREADS=$n_procs
	
	/home/a78156/ESC/dstat-0.7.2/dstat -cdngym --output /home/a78156/ESC/NPB3.3.1/NPB3.3-OMP/results/652/dstat_is_C_O2_"$n_procs".csv > /dev/null & /home/a78156/ESC/NPB3.3.1/NPB3.3-OMP/bin/is.C.x > /home/a78156/ESC/NPB3.3.1/NPB3.3-OMP/results/652/is.C_O2_"$n_procs"
	sleep 2
	kill $!

	/home/a78156/ESC/dstat-0.7.2/dstat -cdngym --output /home/a78156/ESC/NPB3.3.1/NPB3.3-OMP/results/652/dstat_is_A_O2_"$n_procs".csv > /dev/null & /home/a78156/ESC/NPB3.3.1/NPB3.3-OMP/bin/is.A.x > /home/a78156/ESC/NPB3.3.1/NPB3.3-OMP/results/652/is.A_O2_"$n_procs"
	sleep 2
	kill $!
	
	/home/a78156/ESC/dstat-0.7.2/dstat -cdngym --output /home/a78156/ESC/NPB3.3.1/NPB3.3-OMP/results/652/dstat_ep_C_O2_"$n_procs".csv > /dev/null & /home/a78156/ESC/NPB3.3.1/NPB3.3-OMP/bin/ep.C.x > /home/a78156/ESC/NPB3.3.1/NPB3.3-OMP/results/652/ep.C_O2_"$n_procs"
	sleep 2
	kill $!

	/home/a78156/ESC/dstat-0.7.2/dstat -cdngym --output /home/a78156/ESC/NPB3.3.1/NPB3.3-OMP/results/652/dstat_ep_A_O2_"$n_procs".csv > /dev/null & /home/a78156/ESC/NPB3.3.1/NPB3.3-OMP/bin/ep.A.x > /home/a78156/ESC/NPB3.3.1/NPB3.3-OMP/results/652/ep.A_O2_"$n_procs"
	sleep 2
	kill $!
done
