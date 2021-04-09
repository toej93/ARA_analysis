#!/bin/bash


echo ""
echo ""
echo "------------------------------------------------------------"
echo ""
echo ""

RunDir="/users/PAS0654/osu0673/A23_analysis_new2/AraRoot"
echo '[ RunDir: ' $RunDir ' ]'
export RunDir

LaunchDir="/users/PAS0654/osu0673/A23_analysis_new2/a23_analysis_scripts/osc_scripts/run_diffuse/step5-join_filter_reco/sim"
echo '[ LaunchDir: ' $LaunchDir ' ]'
export LaunchDir

station="2"
echo '[ Station: ' $station ' ]'
export station

simulation='1'
echo '[ Simulation: ' $simulation ' ]'
export simulation

echo ""
echo "------------------------------------------------------------"

# account=PCON0003
account=PAS0654

walltime=00:02:00

declare -a con=("1" "2" "3" "4" "5")
declare -a en=("610" "605" "600" "595" "590" "585" "580" "575" "570" "565" "560")

# declare -a con=("1")
# declare -a en=("610" "605")

for config in "${con[@]}"
do
	# echo 'Config '$config

	for energy in "${en[@]}"
	do

		OutputDir="/fs/project/PAS0654/ARA_DATA/A23/sim_v2/Joined/A${station}/c${config}/E${energy}"
		ProcDir="/fs/project/PAS0654/ARA_DATA/A23/sim_v2/ProcessedFile/A${station}/c${config}/E${energy}"
		ErrFile="/fs/project/PAS0654/ARA_DATA/A23/sim_v2/Joined/problems_sim_join_A${station}_c${config}_E${energy}.txt"
		readfile=../A${station}_c${config}_E${energy}_FilterList.txt
		err_out_location=/fs/project/PAS0654/ARA_DATA/A23/sim_v2/Joined/err_out_logs

		#where should the outputs be stored?
		echo '[ Output directory: ' $OutputDir ' ]'
		export OutputDir

		echo '[ Proc file directory: ' $ProcDir ' ]'
		export ProcDir

		#we have to define where in the list of data files we want to start
		FileNumberStart=0
		FileNumberEnd=5000
		# FileNumberEnd=1

		FileNumber=0
		while read line1 && read line2 && read line3 && read line4 && read line5 && read line6 && read line7 && read line8 && read line9 && read line10 && read line11 && read line12 && read line13 && read line14 && read line15 && read line16 && read line17 && read line18 && read line19 && read line20
		do

			if (( $FileNumber >= $FileNumberStart && $FileNumber <= $FileNumberEnd ))
			then

				sa1=($line1)
				f1=${sa1[0]}

				sa2=($line2)
				f2=${sa2[0]}

				sa3=($line3)
				f3=${sa3[0]}

				sa4=($line4)
				f4=${sa4[0]}

				sa5=($line5)
				f5=${sa5[0]}

				sa6=($line6)
				f6=${sa6[0]}

				sa7=($line7)
				f7=${sa7[0]}

				sa8=($line8)
				f8=${sa8[0]}

				sa9=($line9)
				f9=${sa9[0]}

				sa10=($line10)
				f10=${sa10[0]}

				sa11=($line11)
				f11=${sa11[0]}

				sa12=($line12)
				f12=${sa12[0]}

				sa13=($line13)
				f13=${sa13[0]}

				sa14=($line14)
				f14=${sa14[0]}

				sa15=($line15)
				f15=${sa15[0]}

				sa16=($line16)
				f16=${sa16[0]}

				sa17=($line17)
				f17=${sa17[0]}

				sa18=($line18)
				f18=${sa18[0]}

				sa19=($line19)
				f19=${sa19[0]}

				sa20=($line20)
				f20=${sa20[0]}

				qsub -A $account -l walltime=$walltime -e $err_out_location -o $err_out_location -v PROCDIR=$ProcDir,ERRFILE=$ErrFile,LAUNCHDIR=$LaunchDir,RUNDIR=$RunDir,OUTPUTDIR=$OutputDir,STATION=$station,CONFIG=$config,ENERGY=$energy,SIMULATION=$simulation,F1=$f1,F2=$f2,F3=$f3,F4=$f4,F5=$f5,F6=$f6,F7=$f7,F8=$f8,F9=$f9,F10=$f10,F11=$f11,F12=$f12,F13=$f13,F14=$f14,F15=$f15,F16=$f16,F17=$f17,F18=$f18,F19=$f19,F20=$f20 -N 'sim_join_A'$station'_c'$config'_E'$energy'_set'$FileNumber sim_run.sh

			fi

			FileNumber=$((FileNumber+20))

		done < $readfile
	done
done
