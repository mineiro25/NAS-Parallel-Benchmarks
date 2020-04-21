#!/bin/sh

#PBS -N mpi662mx
#PBS -l walltime=03:59:00

#PBS -q day

#PBS -l nodes=2:r662:ppn=32

module purge
module load gcc/5.3.0
module load gnu/openmpi_mx/1.8.4

for n_procs in 2 4 8 16 32;do
	sar -r 1 > /home/a78156/ESC/NPB3.3.1/NPB3.3-MPI/results/662/Memoria_is_C_mx_"$n_procs"_"4".csv & mpirun --map-by node -np $n_procs -mca mtl mx -mca pml cm /home/a78156/ESC/NPB3.3.1/NPB3.3-MPI/bin/is.C."$n_procs" 
	sleep 2
	kill $!

	sar -n DEV 1 > /home/a78156/ESC/NPB3.3.1/NPB3.3-MPI/results/662/Rede_is_C_mx_"$n_procs"_"4".csv & mpirun --map-by node -np $n_procs -mca mtl mx -mca pml cm /home/a78156/ESC/NPB3.3.1/NPB3.3-MPI/bin/is.C."$n_procs" 
	sleep 2
	kill $!

	mpstat -P ALL 1 > /home/a78156/ESC/NPB3.3.1/NPB3.3-MPI/results/662/CPU_is_C_mx_"$n_procs"_"4".csv & mpirun --map-by node -np $n_procs -mca mtl mx -mca pml cm /home/a78156/ESC/NPB3.3.1/NPB3.3-MPI/bin/is.C."$n_procs" 
	sleep 2
	kill $!



	sar -r 1 > /home/a78156/ESC/NPB3.3.1/NPB3.3-MPI/results/662/Memoria_is_A_mx_"$n_procs"_"4".csv & mpirun --map-by node -np $n_procs -mca mtl mx -mca pml cm /home/a78156/ESC/NPB3.3.1/NPB3.3-MPI/bin/is.A."$n_procs" 
	sleep 2
	kill $!

	sar -n DEV 1 > /home/a78156/ESC/NPB3.3.1/NPB3.3-MPI/results/662/Rede_is_A_mx_"$n_procs"_"4".csv & mpirun --map-by node -np $n_procs -mca mtl mx -mca pml cm /home/a78156/ESC/NPB3.3.1/NPB3.3-MPI/bin/is.A."$n_procs" 
	sleep 2
	kill $!

	mpstat -P ALL 1 > /home/a78156/ESC/NPB3.3.1/NPB3.3-MPI/results/662/CPU_is_A_mx_"$n_procs"_"4".csv & mpirun --map-by node -np $n_procs -mca mtl mx -mca pml cm /home/a78156/ESC/NPB3.3.1/NPB3.3-MPI/bin/is.A."$n_procs" 
	sleep 2
	kill $!



	
	sar -r 1 > /home/a78156/ESC/NPB3.3.1/NPB3.3-MPI/results/662/Memoria_ep_C_mx_"$n_procs"_"4".csv & mpirun --map-by node -np $n_procs -mca mtl mx -mca pml cm /home/a78156/ESC/NPB3.3.1/NPB3.3-MPI/bin/ep.C."$n_procs"
	sleep 2
	kill $!

	sar -n DEV 1 > /home/a78156/ESC/NPB3.3.1/NPB3.3-MPI/results/662/Rede_ep_C_mx_"$n_procs"_"4".csv & mpirun --map-by node -np $n_procs -mca mtl mx -mca pml cm /home/a78156/ESC/NPB3.3.1/NPB3.3-MPI/bin/ep.C."$n_procs" 
	sleep 2
	kill $!

	mpstat -P ALL 1 > /home/a78156/ESC/NPB3.3.1/NPB3.3-MPI/results/662/CPU_ep_C_mx_"$n_procs"_"4".csv & mpirun --map-by node -np $n_procs -mca mtl mx -mca pml cm /home/a78156/ESC/NPB3.3.1/NPB3.3-MPI/bin/ep.C."$n_procs" 
	sleep 2
	kill $!




	sar -r 1 > /home/a78156/ESC/NPB3.3.1/NPB3.3-MPI/results/662/Memoria_ep_A_mx_"$n_procs"_"4".csv & mpirun --map-by node -np $n_procs -mca mtl mx -mca pml cm /home/a78156/ESC/NPB3.3.1/NPB3.3-MPI/bin/ep.A."$n_procs"
	sleep 2
	kill $!

	sar -n DEV 1 > /home/a78156/ESC/NPB3.3.1/NPB3.3-MPI/results/662/Rede_ep_A_mx_"$n_procs"_"4".csv & mpirun --map-by node -np $n_procs -mca mtl mx -mca pml cm /home/a78156/ESC/NPB3.3.1/NPB3.3-MPI/bin/ep.A."$n_procs" 
	sleep 2
	kill $!

	mpstat -P ALL 1 > /home/a78156/ESC/NPB3.3.1/NPB3.3-MPI/results/662/CPU_ep_A_mx_"$n_procs"_"4".csv & mpirun --map-by node -np $n_procs -mca mtl mx -mca pml cm /home/a78156/ESC/NPB3.3.1/NPB3.3-MPI/bin/ep.A."$n_procs" 
	sleep 2
	kill $!
done
