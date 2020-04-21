#!/bin/sh

#PBS -N hybrid662mx
#PBS -l walltime=02:59:00

#PBS -q day

#PBS -l nodes=2:r662:ppn=32

module purge
module load gcc/5.3.0
module load gnu/openmpi_mx/1.8.4

for n_procs in 2 4 8 16 32;do
	export OMP_NUM_THREADS=4
	sar -r 1 > /home/a78156/ESC/NPB3.3.1/NPB3.3-MPI/results/662/Memoria_hybrid_is_C_mx_"$n_procs"_"4".csv & mpirun --map-by socket:PE=2 -np $n_procs -mca btl self,sm,tcp /home/a78156/ESC/NPB3.3.1/NPB3.3-MPI/bin/is.C."$n_procs" 
	sleep 2
	kill $!

	sar -n DEV 1 > /home/a78156/ESC/NPB3.3.1/NPB3.3-MPI/results/662/Rede_hybrid_is_C_mx_"$n_procs"_"4".csv & mpirun --map-by socket:PE=2 -np $n_procs -mca btl self,sm,tcp /home/a78156/ESC/NPB3.3.1/NPB3.3-MPI/bin/is.C."$n_procs" 
	sleep 2
	kill $!

	mpstat -P ALL 1 > /home/a78156/ESC/NPB3.3.1/NPB3.3-MPI/results/662/CPU_hybrid_is_C_mx_"$n_procs"_"4".csv & mpirun --map-by socket:PE=2 -np $n_procs -mca btl self,sm,tcp /home/a78156/ESC/NPB3.3.1/NPB3.3-MPI/bin/is.C."$n_procs" 
	sleep 2
	kill $!



	sar -r 1 > /home/a78156/ESC/NPB3.3.1/NPB3.3-MPI/results/662/Memoria_hybrid_is_A_mx_"$n_procs"_"4".csv & mpirun --map-by socket:PE=2 -np $n_procs -mca btl self,sm,tcp /home/a78156/ESC/NPB3.3.1/NPB3.3-MPI/bin/is.A."$n_procs" 
	sleep 2
	kill $!

	sar -n DEV 1 > /home/a78156/ESC/NPB3.3.1/NPB3.3-MPI/results/662/Rede_hybrid_is_A_mx_"$n_procs"_"4".csv & mpirun --map-by socket:PE=2 -np $n_procs -mca btl self,sm,tcp /home/a78156/ESC/NPB3.3.1/NPB3.3-MPI/bin/is.A."$n_procs" 
	sleep 2
	kill $!

	mpstat -P ALL 1 > /home/a78156/ESC/NPB3.3.1/NPB3.3-MPI/results/662/CPU_hybrid_is_A_mx_"$n_procs"_"4".csv & mpirun --map-by socket:PE=2 -np $n_procs -mca btl self,sm,tcp /home/a78156/ESC/NPB3.3.1/NPB3.3-MPI/bin/is.A."$n_procs" 
	sleep 2
	kill $!



	
	sar -r 1 > /home/a78156/ESC/NPB3.3.1/NPB3.3-MPI/results/662/Memoria_hybrid_ep_C_mx_"$n_procs"_"4".csv & mpirun --map-by socket:PE=2 -np $n_procs -mca btl self,sm,tcp /home/a78156/ESC/NPB3.3.1/NPB3.3-MPI/bin/ep.C."$n_procs"
	sleep 2
	kill $!

	sar -n DEV 1 > /home/a78156/ESC/NPB3.3.1/NPB3.3-MPI/results/662/Rede_hybrid_ep_C_mx_"$n_procs"_"4".csv & mpirun --map-by socket:PE=2 -np $n_procs -mca btl self,sm,tcp /home/a78156/ESC/NPB3.3.1/NPB3.3-MPI/bin/ep.C."$n_procs" 
	sleep 2
	kill $!

	mpstat -P ALL 1 > /home/a78156/ESC/NPB3.3.1/NPB3.3-MPI/results/662/CPU_hybrid_ep_C_mx_"$n_procs"_"4".csv & mpirun --map-by socket:PE=2 -np $n_procs -mca btl self,sm,tcp /home/a78156/ESC/NPB3.3.1/NPB3.3-MPI/bin/ep.C."$n_procs" 
	sleep 2
	kill $!




	sar -r 1 > /home/a78156/ESC/NPB3.3.1/NPB3.3-MPI/results/662/Memoria_hybrid_ep_A_mx_"$n_procs"_"4".csv & mpirun --map-by socket:PE=2 -np $n_procs -mca btl self,sm,tcp /home/a78156/ESC/NPB3.3.1/NPB3.3-MPI/bin/ep.A."$n_procs"
	sleep 2
	kill $!

	sar -n DEV 1 > /home/a78156/ESC/NPB3.3.1/NPB3.3-MPI/results/662/Rede_hybrid_ep_A_mx_"$n_procs"_"4".csv & mpirun --map-by socket:PE=2 -np $n_procs -mca btl self,sm,tcp /home/a78156/ESC/NPB3.3.1/NPB3.3-MPI/bin/ep.A."$n_procs" 
	sleep 2
	kill $!

	mpstat -P ALL 1 > /home/a78156/ESC/NPB3.3.1/NPB3.3-MPI/results/662/CPU_hybrid_ep_A_mx_"$n_procs"_"4".csv & mpirun --map-by socket:PE=2 -np $n_procs -mca btl self,sm,tcp /home/a78156/ESC/NPB3.3.1/NPB3.3-MPI/bin/ep.A."$n_procs" 
	sleep 2
	kill $!
done
