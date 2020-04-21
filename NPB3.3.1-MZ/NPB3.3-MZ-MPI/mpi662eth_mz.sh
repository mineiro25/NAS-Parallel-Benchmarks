#!/bin/sh

#PBS -N mpi662eth_mz
#PBS -l walltime=03:59:00

#PBS -q day

#PBS -l nodes=2:r662:ppn=32

module purge
module load gcc/5.3.0
module load gnu/openmpi_eth/2.0.0

for n_procs in 2;do
	sar -r 1 > /home/a78156/ESC/NPB3.3.1-MZ/NPB3.3-MZ-MPI/results/662/Memoria_sp-mz_C_eth_"$n_procs"_"4".csv & mpirun --map-by node -np $n_procs -mca btl self,sm,tcp /home/a78156/ESC/NPB3.3.1-MZ/NPB3.3-MZ-MPI/bin/sp-mz.C."$n_procs" 
	sleep 2
	kill $!

	sar -n DEV 1 > /home/a78156/ESC/NPB3.3.1-MZ/NPB3.3-MZ-MPI/results/662/Rede_sp-mz_C_eth_"$n_procs"_"4".csv & mpirun --map-by node -np $n_procs -mca btl self,sm,tcp /home/a78156/ESC/NPB3.3.1-MZ/NPB3.3-MZ-MPI/bin/sp-mz.C."$n_procs" 
	sleep 2
	kill $!

	mpstat -P ALL 1 > /home/a78156/ESC/NPB3.3.1-MZ/NPB3.3-MZ-MPI/results/662/CPU_sp-mz_C_eth_"$n_procs"_"4".csv & mpirun --map-by node -np $n_procs -mca btl self,sm,tcp /home/a78156/ESC/NPB3.3.1-MZ/NPB3.3-MZ-MPI/bin/sp-mz.C."$n_procs" 
	sleep 2
	kill $!



	sar -r 1 > /home/a78156/ESC/NPB3.3.1-MZ/NPB3.3-MZ-MPI/results/662/Memoria_sp-mz_A_eth_"$n_procs"_"4".csv & mpirun --map-by node -np $n_procs -mca btl self,sm,tcp /home/a78156/ESC/NPB3.3.1-MZ/NPB3.3-MZ-MPI/bin/sp-mz.A."$n_procs" 
	sleep 2
	kill $!

	sar -n DEV 1 > /home/a78156/ESC/NPB3.3.1-MZ/NPB3.3-MZ-MPI/results/662/Rede_sp-mz_A_eth_"$n_procs"_"4".csv & mpirun --map-by node -np $n_procs -mca btl self,sm,tcp /home/a78156/ESC/NPB3.3.1-MZ/NPB3.3-MZ-MPI/bin/sp-mz.A."$n_procs" 
	sleep 2
	kill $!

	mpstat -P ALL 1 > /home/a78156/ESC/NPB3.3.1-MZ/NPB3.3-MZ-MPI/results/662/CPU_sp-mz_A_eth_"$n_procs"_"4".csv & mpirun --map-by node -np $n_procs -mca btl self,sm,tcp /home/a78156/ESC/NPB3.3.1-MZ/NPB3.3-MZ-MPI/bin/sp-mz.A."$n_procs" 
	sleep 2
	kill $!
done
