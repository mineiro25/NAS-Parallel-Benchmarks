#!/bin/sh

#PBS -N mpi652eth
#PBS -l walltime=03:59:00

#PBS -q day

#PBS -l nodes=2:r652:ppn=16

module purge
module load gcc/4.9.0
module load gnu/openmpi_eth/1.8.4

for n_procs in 2 4 8 16 32;do
	/home/a78156/ESC/dstat-0.7.2/dstat --cpu --mem --io --disk -n --fs --output /home/a78156/ESC/NPB3.3.1/NPB3.3-MPI/results/652/dstat_is_C_eth_"$n_procs".csv > /dev/null & mpirun -np $n_procs --map-by node -mca btl self,sm,tcp /home/a78156/ESC/NPB3.3.1/NPB3.3-MPI/bin/is.C."$n_procs" > /home/a78156/ESC/NPB3.3.1/NPB3.3-MPI/results/652/is.C_eth_"$n_procs"
	sleep 2
	kill $!

	/home/a78156/ESC/dstat-0.7.2/dstat --cpu --mem --io --disk -n --fs --output /home/a78156/ESC/NPB3.3.1/NPB3.3-MPI/results/652/dstat_is_A_eth_"$n_procs".csv > /dev/null & mpirun -np $n_procs --map-by node -mca btl self,sm,tcp /home/a78156/ESC/NPB3.3.1/NPB3.3-MPI/bin/is.A."$n_procs" > /home/a78156/ESC/NPB3.3.1/NPB3.3-MPI/results/652/is.A_eth_"$n_procs"
	sleep 2
	kill $!
	
	/home/a78156/ESC/dstat-0.7.2/dstat --cpu --mem --io --disk -n --fs --output /home/a78156/ESC/NPB3.3.1/NPB3.3-MPI/results/652/dstat_ep_C_eth_"$n_procs".csv > /dev/null & mpirun -np $n_procs --map-by node -mca btl self,sm,tcp /home/a78156/ESC/NPB3.3.1/NPB3.3-MPI/bin/ep.C."$n_procs" > /home/a78156/ESC/NPB3.3.1/NPB3.3-MPI/results/652/ep.C_eth_"$n_procs"
	sleep 2
	kill $!

	/home/a78156/ESC/dstat-0.7.2/dstat --cpu --mem --io --disk -n --fs --output /home/a78156/ESC/NPB3.3.1/NPB3.3-MPI/results/652/dstat_ep_A_eth_"$n_procs".csv > /dev/null & mpirun -np $n_procs --map-by node -mca btl self,sm,tcp /home/a78156/ESC/NPB3.3.1/NPB3.3-MPI/bin/ep.A."$n_procs" > /home/a78156/ESC/NPB3.3.1/NPB3.3-MPI/results/652/ep.A_eth_"$n_procs"
	sleep 2
	kill $!
done
