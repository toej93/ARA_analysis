#!/bin/bash

station="2"
echo '[ Station: ' $station ' ]'
export station

simulation='0'
echo '[ Simulation: ' $simulation ' ]'
export simulation

energy="224"
echo '[ Energy: ' $energy ']'
export energy

config="4"
echo '[ Config: ' $config ']'
export config

DropBadChans='1'
echo '[ DropBadChans?: ' $DropBadChans ' ]'
export DropBadChans

#some cut values
V_SNR_BIN=0
H_SNR_BIN=0
V_WFRMS_CUT=-1.30
H_WFRMS_CUT=-1.40
export V_SNR_BIN
export H_SNR_BIN
export V_WFRMS_CUT
export H_WFRMS_CUT

# account=PCON0003                                                                                                                                                                   
account=PAS0654

if [ $simulation == '1' ] #is simulation
then
	# OutputDir="/fs/project/PAS0654/ARA_DATA/A23/sim/ValsForCuts/A${station}/c${config}/E${energy}"
	# readfile=../sim_by_config/A${station}_c${config}_E${energy}_MergedFiles.txt
	# err_out_location=/fs/scratch/PAS0654/ara/sim/err_out_logs
	# walltime=00:20:00
	echo "Why are you running this on simulation? Exiting..."
	exit 1 #bounce out, we shouldn't be trying to do this on simulation...
elif [ $simulation == '0' ] #is not simulation
then
	OutputDir="/fs/project/PAS0654/ARA_DATA/A23/10pct_verify_try2/ValsForCuts/A${station}/c${config}"
	readfile=../data_by_config/A${station}_c${config}_RecoFiles_pitzer.txt
	readfile=data_savevalsproblems10_A${station}_${config}.txt
	err_out_location=/fs/project/PAS0654/ARA_DATA/A23/10pct_verify_try2/err_out_log
	
	DataDir="/fs/project/PAS0654/ARA_DATA/A23/10pct/"
	CWDir="/fs/project/PAS0654/ARA_DATA/A23/10pct_verify_try2/"
	RunSumDir="/fs/project/PAS0654/ARA_DATA/A23/10pct_verify_try2/"
	walltime=02:30:00
	ErrFile="/fs/project/PAS0654/ARA_DATA/A23/10pct_verify_try2/ValsForCuts/data_savevalsproblems10_A${station}_${config}.txt"
fi

#where should the outputs be stored?
echo '[ Output directory: ' $OutputDir ' ]'
export OutputDir

RunDir="/users/PAS0654/osu0673/A23_analysis_new2/AraRoot"
echo '[ RunDir: ' $RunDir ' ]'
export RunDir

LaunchDir="/users/PAS0654/osu0673/A23_analysis_new2/a23_analysis_scripts/osc_scripts/run_diffuse/10pct/step6-save_vals_for_cuts/v2_multi"
echo '[ LaunchDir: ' $LaunchDir ' ]'
export LaunchDir

#we have to define where in the list of data files we want to start
FileNumberStart=0
FileNumberEnd=4000

FileNumber=0
while read line1 && read line2 && read line3 && read line4 && read line5 && read line6 && read line7 && read line8 && read line9 && read line10 && read line11 && read line12 && read line13 && read line14 && read line15 && read line16 && read line17 && read line18 && read line19 && read line20 && read line21 && read line22 && read line23 && read line24 && read line25 && read line26 && read line27 && read line28
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
		p8=${sa8[1]}

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

		sa21=($line21)
		f21=${sa21[0]}

		sa22=($line22)
		f22=${sa22[0]}

		sa23=($line23)
		f23=${sa23[0]}

		sa24=($line24)
		f24=${sa24[0]}

		sa25=($line25)
		f25=${sa25[0]}

		sa26=($line26)
		f26=${sa26[0]}

		sa27=($line27)
		f27=${sa27[0]}

		sa28=($line28)
		f28=${sa28[0]}
		p28=${sa28[1]}


		if [ $simulation == '1' ] #is simulation
		then
			qsub -A $account -l walltime=$walltime -e $err_out_location -o $err_out_location -v RUNSUMDIR=$RunSumDir,ERRFILE=$ErrFile,CWDIR=$CWDir,DATADIR=$DataDir,LAUNCHDIR=$LaunchDir,RUNDIR=$RunDir,OUTPUTDIR=$OutputDir,DROPCHANS=$DropBadChans,STATION=$station,CONFIG=$config,ENERGY=$energy,SIMULATION=$simulation,VBIN=$V_SNR_BIN,HBIN=$H_SNR_BIN,VCUT=$V_WFRMS_CUT,HCUT=$H_WFRMS_CUT,F1=$f1,P1=$p1,F2=$f2,P2=$p2,F3=$f3,P3=$p3,F4=$f4,P4=$p4,F5=$f5,P5=$p5,F6=$f6,P6=$p6,F7=$f7,P7=$p7,F8=$f8,P8=$p8,F9=$f9,P9=$p9,F10=$f10,P10=$p10,F11=$f11,P11=$p11,F12=$f12,P12=$p12,F13=$f13,P13=$p13,F14=$f14,P14=$p14,F15=$f15,P15=$p15,F16=$f16,P16=$p16,F17=$f17,P17=$p17,F18=$f18,P18=$p18,F19=$f19,P19=$p19,F20=$f20,P20=$p20,F21=$f21,P21=$p21,F22=$f22,P22=$p22,F23=$f23,P23=$p23,F24=$f24,P24=$p24,F25=$f25,P25=$p25,F26=$f26,P26=$p26,F27=$f27,P27=$p27,F28=$f28,P28=$p28 -N 'owens_multi28_A'$station'_c'$config'_E'$energy'_'$FileNumber'_simsavevals10' owens_run.sh
		elif [ $simulation == '0' ] #is not simulation
		then
			qsub -A $account -l walltime=$walltime -e $err_out_location -o $err_out_location -v RUNSUMDIR=$RunSumDir,ERRFILE=$ErrFile,CWDIR=$CWDir,DATADIR=$DataDir,LAUNCHDIR=$LaunchDir,RUNDIR=$RunDir,OUTPUTDIR=$OutputDir,DROPCHANS=$DropBadChans,STATION=$station,CONFIG=$config,ENERGY=$energy,SIMULATION=$simulation,VBIN=$V_SNR_BIN,HBIN=$H_SNR_BIN,VCUT=$V_WFRMS_CUT,HCUT=$H_WFRMS_CUT,F1=$f1,P1=$p1,F2=$f2,P2=$p2,F3=$f3,P3=$p3,F4=$f4,P4=$p4,F5=$f5,P5=$p5,F6=$f6,P6=$p6,F7=$f7,P7=$p7,F8=$f8,P8=$p8,F9=$f9,P9=$p9,F10=$f10,P10=$p10,F11=$f11,P11=$p11,F12=$f12,P12=$p12,F13=$f13,P13=$p13,F14=$f14,P14=$p14,F15=$f15,P15=$p15,F16=$f16,P16=$p16,F17=$f17,P17=$p17,F18=$f18,P18=$p18,F19=$f19,P19=$p19,F20=$f20,P20=$p20,F21=$f21,P21=$p21,F22=$f22,P22=$p22,F23=$f23,P23=$p23,F24=$f24,P24=$p24,F25=$f25,P25=$p25,F26=$f26,P26=$p26,F27=$f27,P27=$p27,F28=$f28,P28=$p28 -N 'owens_multi28_A'$station'_c'$config'_'$FileNumber'_datasavevals10' owens_run.sh
		fi	
		echo "-----------------------------------"
			
	fi
	FileNumber=$((FileNumber+28))

done < $readfile
