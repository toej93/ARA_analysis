#!/bin/bash

station="2"
echo '[ Station: ' $station ' ]'
export station

year="2014"
echo '[ Station: ' $year ' ]'
export year

simulation='1'
echo '[ Simulation: ' $simulation ' ]'
export simulation

energy='224'
echo '[ Energy: ' $energy ']'
export energy

config="5"
echo '[ Config: ' $config ']'
export config

account=PAS0654
walltime=00:03:00

if [ $simulation == '1' ] #is simulation
then
	OutputDir="/fs/scratch/PAS0654/ara/sim/Joined/A${station}/c${config}/E${energy}"
	ProcDir="/fs/scratch/PAS0654/ara/sim/ProcessedFile/A${station}/c${config}/E${energy}"
	ErrFile="/fs/scratch/PAS0654/ara/sim/Joined/sim_joinproblems_A${station}_E${energy}.txt"
	readfile=../A${station}_c${config}_E${energy}_FilterList.txt
	err_out_location=/fs/scratch/PAS0654/ara/sim/err_out_logs

elif [ $simulation == '0' ] #is not simulation
then
	OutputDir="/fs/scratch/PAS0654/ara/10pct/Joined/A${station}/${year}"
	ProcDir="/fs/scratch/PAS0654/ara/10pct/ProcessedFile/A${station}/${year}"
	ErrFile="/fs/scratch/PAS0654/ara/10pct/Joined/data_joinproblems_A${station}_${year}.txt"
	readfile=../A${station}FilterList_1in10_${year}_pitzer.txt
	err_out_location=/fs/scratch/PAS0654/ara/10pct/err_out_logs
fi

#where should the outputs be stored?
echo '[ Output directory: ' $OutputDir ' ]'
export OutputDir

echo '[ Proc file directory: ' $ProcDir ' ]'
export ProcDir

RunDir="/users/PAS0654/osu0673/A23_analysis_new2/AraRoot"
export RunDir

LaunchDir="/users/PAS0654/osu0673/A23_analysis_new2/a23_analysis_scripts/osc_scripts/run_diffuse/step5-join_filter_reco/v2_multi"
echo '[ LaunchDir: ' $LaunchDir ' ]'
export LaunchDir

#we have to define where in the list of data files we want to start
FileNumberStart=0
FileNumberEnd=5000

# readfile=../A${station}_${year}_MergedFiles_pitzer.txt

FileNumber=0
while read line1 && read line2 && read line3 && read line4 && read line5 && read line6 && read line7 && read line8 && read line9 && read line10 && read line11 && read line12 && read line13 && read line14 && read line15 && read line16 && read line17 && read line18 && read line19 && read line20 && read line21 && read line22 && read line23 && read line24 && read line25 && read line26 && read line27 && read line28
do

	if (( $FileNumber >= $FileNumberStart && $FileNumber <= $FileNumberEnd ))
	then

		sa1=($line1)
		f1=${sa1[0]}
		p1=${sa1[1]}

		sa2=($line2)
		f2=${sa2[0]}
		p2=${sa2[1]}

		sa3=($line3)
		f3=${sa3[0]}
		p3=${sa3[1]}

		sa4=($line4)
		f4=${sa4[0]}
		p4=${sa4[1]}

		sa5=($line5)
		f5=${sa5[0]}
		p5=${sa5[1]}

		sa6=($line6)
		f6=${sa6[0]}
		p6=${sa6[1]}

		sa7=($line7)
		f7=${sa7[0]}
		p7=${sa7[1]}

		sa8=($line8)
		f8=${sa8[0]}
		p8=${sa8[1]}

		sa9=($line9)
		f9=${sa9[0]}
		p9=${sa9[1]}

		sa10=($line10)
		f10=${sa10[0]}
		p10=${sa10[1]}

		sa11=($line11)
		f11=${sa11[0]}
		p11=${sa11[1]}

		sa12=($line12)
		f12=${sa12[0]}
		p12=${sa12[1]}

		sa13=($line13)
		f13=${sa13[0]}
		p13=${sa13[1]}

		sa14=($line14)
		f14=${sa14[0]}
		p14=${sa14[0]}

		sa15=($line15)
		f15=${sa15[0]}
		p15=${sa15[0]}

		sa16=($line16)
		f16=${sa16[0]}
		p16=${sa16[0]}

		sa17=($line17)
		f17=${sa17[0]}
		p17=${sa17[0]}

		sa18=($line18)
		f18=${sa18[0]}
		p18=${sa18[0]}

		sa19=($line19)
		f19=${sa19[0]}
		p19=${sa19[0]}

		sa20=($line20)
		f20=${sa20[0]}
		p20=${sa20[0]}

		sa21=($line21)
		f21=${sa21[0]}
		p21=${sa21[0]}

		sa22=($line22)
		f22=${sa22[0]}
		p22=${sa22[0]}

		sa23=($line23)
		f23=${sa23[0]}
		p23=${sa23[0]}

		sa24=($line24)
		f24=${sa24[0]}
		p24=${sa24[0]}

		sa25=($line25)
		f25=${sa25[0]}
		p25=${sa25[0]}

		sa26=($line26)
		f26=${sa26[0]}
		p26=${sa26[0]}

		sa27=($line27)
		f27=${sa27[0]}
		p27=${sa27[0]}

		sa28=($line28)
		f28=${sa28[0]}
		p28=${sa28[1]}

		if [ $simulation == '0' ] #is no simulation
		then
			qsub -A $account -l walltime=$walltime -e $err_out_location -o $err_out_location -v PROCDIR=$ProcDir,ERRFILE=$ErrFile,LAUNCHDIR=$LaunchDir,RUNDIR=$RunDir,OUTPUTDIR=$OutputDir,STATION=$station,YEAR=$year,CONFIG=$config,ENERGY=$energy,SIMULATION=$simulation,F1=$f1,P1=$p1,F2=$f2,P2=$p2,F3=$f3,P3=$p3,F4=$f4,P4=$p4,F5=$f5,P5=$p5,F6=$f6,P6=$p6,F7=$f7,P7=$p7,F8=$f8,P8=$p8,F9=$f9,P9=$p9,F10=$f10,P10=$p10,F11=$f11,P11=$p11,F12=$f12,P12=$p12,F13=$f13,P13=$p13,F14=$f14,P14=$p14,F15=$f15,P15=$p15,F16=$f16,P16=$p16,F17=$f17,P17=$p17,F18=$f18,P18=$p18,F19=$f19,P19=$p19,F20=$f20,P20=$p20,F21=$f21,P21=$p21,F22=$f22,P22=$p22,F23=$f23,P23=$p23,F24=$f24,P24=$p24,F25=$f25,P25=$p25,F26=$f26,P26=$p26,F27=$f27,P27=$p27,F28=$f28,P28=$p28 -N 'join_multi28_A'$station'_'$year'_'$FileNumber'_data' owens_run.sh	
		elif [ $simulation == '1' ] #is simulation
		then
			qsub -A $account -l walltime=$walltime -e $err_out_location -o $err_out_location -v PROCDIR=$ProcDir,ERRFILE=$ErrFile,LAUNCHDIR=$LaunchDir,RUNDIR=$RunDir,OUTPUTDIR=$OutputDir,STATION=$station,YEAR=$year,CONFIG=$config,ENERGY=$energy,SIMULATION=$simulation,F1=$f1,P1=$p1,F2=$f2,P2=$p2,F3=$f3,P3=$p3,F4=$f4,P4=$p4,F5=$f5,P5=$p5,F6=$f6,P6=$p6,F7=$f7,P7=$p7,F8=$f8,P8=$p8,F9=$f9,P9=$p9,F10=$f10,P10=$p10,F11=$f11,P11=$p11,F12=$f12,P12=$p12,F13=$f13,P13=$p13,F14=$f14,P14=$p14,F15=$f15,P15=$p15,F16=$f16,P16=$p16,F17=$f17,P17=$p17,F18=$f18,P18=$p18,F19=$f19,P19=$p19,F20=$f20,P20=$p20,F21=$f21,P21=$p21,F22=$f22,P22=$p22,F23=$f23,P23=$p23,F24=$f24,P24=$p24,F25=$f25,P25=$p25,F26=$f26,P26=$p26,F27=$f27,P27=$p27,F28=$f28,P28=$p28 -N 'join_multi28_A'$station'_c'$config'_E'$energy'_'$FileNumber'_sim' owens_run.sh
		fi
		echo "-----------------------------------"
	fi

	FileNumber=$((FileNumber+28))

done < $readfile
