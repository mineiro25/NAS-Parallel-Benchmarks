#!/bin/sh

#PBS -N hybrid652eth
#PBS -l walltime=03:59:00

#PBS -q day

#PBS -l nodes=2:r652:ppn=16

module purge
module load gcc/5.3.0
module load gnu/openmpi_eth/2.0.0

for n_procs in 2 4 8 16 32;do
	export OMP_NUM_THREADS=12
	/home/a78156/ESC/dstat-0.7.2/dstat --cpu --mem --io --disk -n --fs --output /home/a78156/ESC/NPB3.3.1/NPB3.3-MPI/results/652/dstat_hybrid_is_C_eth_"$n_procs"_"12".csv > /dev/null & mpirun --map-by socket:PE=8 -np $n_procs -mca btl self,sm,tcp /home/a78156/ESC/NPB3.3.1/NPB3.3-MPI/bin/is.C."$n_procs" > /home/a78156/ESC/NPB3.3.1/NPB3.3-MPI/results/652/hybrid_is.C_eth_"$n_procs"_"12"
	sleep 2
	kill $!

	/home/a78156/ESC/dstat-0.7.2/dstat --cpu --mem --io --disk -n --fs --output /home/a78156/ESC/NPB3.3.1/NPB3.3-MPI/results/652/dstat_hybrid_is_A_eth_"$n_procs"_"12".csv > /dev/null & mpirun --map-by socket:PE=8 -np $n_procs -mca btl self,sm,tcp /home/a78156/ESC/NPB3.3.1/NPB3.3-MPI/bin/is.A."$n_procs" > /home/a78156/ESC/NPB3.3.1/NPB3.3-MPI/results/652/hybrid_is.A_eth_"$n_procs"_"12"
	sleep 2
	kill $!
	
	/home/a78156/ESC/dstat-0.7.2/dstat --cpu --mem --io --disk -n --fs --output /home/a78156/ESC/NPB3.3.1/NPB3.3-MPI/results/652/dstat_hybrid_ep_C_eth_"$n_procs"_"12".csv > /dev/null & mpirun --map-by socket:PE=8 -np $n_procs -mca btl self,sm,tcp /home/a78156/ESC/NPB3.3.1/NPB3.3-MPI/bin/ep.C."$n_procs" > /home/a78156/ESC/NPB3.3.1/NPB3.3-MPI/results/652/hybrid_ep.C_eth_"$n_procs"_"12"
	sleep 2
	kill $!

	/home/a78156/ESC/dstat-0.7.2/dstat --cpu --mem --io --disk -n --fs --output /home/a78156/ESC/NPB3.3.1/NPB3.3-MPI/results/652/dstat_hybrid_ep_A_eth_"$n_procs"_"12".csv > /dev/null & mpirun --map-by socket:PE=8 -np $n_procs -mca btl self,sm,tcp /home/a78156/ESC/NPB3.3.1/NPB3.3-MPI/bin/ep.A."$n_procs" > /home/a78156/ESC/NPB3.3.1/NPB3.3-MPI/results/652/hybrid_ep.A_eth_"$n_procs"_"12"
	sleep 2
	kill $!
done
