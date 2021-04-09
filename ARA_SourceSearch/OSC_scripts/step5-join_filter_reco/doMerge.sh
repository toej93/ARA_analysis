#!/bin/bash

station="2"
echo '[ Station: ' $station ' ]'
export station

year="2015"
echo '[ Station: ' $year ' ]'
export year

simulation='0'
echo '[ Simulation: ' $simulation ' ]'
export simulation

energy='18.0'
echo '[ Energy: ' $energy ']'
export energy

config="4"
echo '[ Config: ' $config ']'
export config

if [ $simulation == '1' ] #is simulation
then
	OutputDir="/fs/scratch/PAS0654/ara/sim/Joined/A${station}/c${config}/E${energy}"
	ProcDir="/fs/scratch/PAS0654/ara/sim/ProcessedFile/A${station}/c${config}/E${energy}"
	ErrFile="/fs/scratch/PAS0654/ara/sim/Joined/sim_joinproblems_A${station}_E${energy}.txt"
	readfile=A${station}_c${config}_E${energy}_FilterList.txt
	err_out_location=/fs/scratch/PAS0654/ara/sim/err_out_logs

elif [ $simulation == '0' ] #is not simulation
then
	OutputDir="/fs/scratch/PAS0654/ara/10pct/Joined/A${station}/${year}"
	ProcDir="/fs/scratch/PAS0654/ara/10pct/ProcessedFile/A${station}/${year}"
	ErrFile="/fs/scratch/PAS0654/ara/10pct/Joined/data_joinproblems_A${station}_${year}.txt"
	readfile=A${station}FilterList_1in10_${year}.txt
	err_out_location=/fs/scratch/PAS0654/ara/10pct/err_out_logs
fi

#where should the outputs be stored?
echo '[ Output directory: ' $OutputDir ' ]'
export OutputDir

echo '[ Proc file directory: ' $ProcDir ' ]'
export ProcDir

RunDir="/users/PAS0654/osu0673/A23_analysis_new2/AraRoot"
export RunDir

eval 'source /users/PAS0654/osu0673/A23_analysis_new2/env.sh'
counter=0
while read line
do
	echo $line

	if [ $simulation == '1' ] #is simulation
	then
		qsub -e $err_out_location -o $err_out_location -v ERRFILE=$ErrFile,RUNDIR=$RunDir,OUTPUTDIR=$OutputDir,STATION=$station,YEAR=$year,FILE=$line,PROCDIR=$ProcDir -N 'join_A'$station'_c'${config}'_E'$energy'_'$counter run.sh
	elif [ $simulation == '0' ] #is not simulation
	then
		# qsub -e $err_out_location -o $err_out_location -v ERRFILE=$ErrFile,RUNDIR=$RunDir,OUTPUTDIR=$OutputDir,STATION=$station,YEAR=$year,FILE=$line,PROCDIR=$ProcDir -N 'join_A'$station'_'$year'_'$counter run.sh
		cd $RunDir
		./bin/v2_Join $station $OutputDir $ProcDir $line
		if [ $? -ne 0 ] #error handle
		then
			echo $line >> /fs/scratch/PAS0654/ara/10pct/Joined/problems_A${station}_${year}_join_errors.txt
		fi

	fi	
	counter=$((counter+1))
done < $readfile
