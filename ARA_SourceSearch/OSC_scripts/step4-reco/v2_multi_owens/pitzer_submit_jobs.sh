#!/bin/bash

#./owens_doThis.sh $SIMULATION $STATION $YEAR $FILTERDIR $TMPDIR $F1 $P1 &

station="2"
echo '[ Station: ' $station ' ]'
export station

year="2013"
echo '[ Station: ' $year ' ]'
export year

simulation='0'
echo '[ Simulation: ' $simulation ' ]'
export simulation

energy="224"
echo '[ Energy: ' $energy ']'
export energy

config="2"
echo '[ Config: ' $config ']'
export config

DropBadChans='1'
echo '[ DropBadChans?: ' $DropBadChans ' ]'
export DropBadChans

#where are the run summaries?
FilterDir="/fs/project/PAS0654/ARA_DATA/A23/10pct_verify/ProcessedFile/A${station}/${year}"
echo '[ Run summary directory: ' $FilterDir ' ]'
export FilterDir

# account=PCON0003
account=PAS0654

if [ $simulation == '1' ] #is simulation
then
	OutputDir="/fs/scratch/PAS0654/ara/sim/ProcessedFile/A${station}/c${config}/E${energy}"
	ErrFile="/fs/scratch/PAS0654/ara/sim/ProcessedFile/sim_filterproblems_A${station}_E${energy}_c${config}.txt"
	readfile=../../sim_lists/raw_A${station}_c${config}_E${energy}.txt
	err_out_location=/fs/scratch/PAS0654/ara/sim/err_out_logs
	walltime=00:10:00
elif [ $simulation == '0' ] #is not simulation
then
	OutputDir="/fs/project/PAS0654/ARA_DATA/A23/10pct_verify_try2/ProcessedFile/A${station}/${year}"
	ErrFile="/fs/project/PAS0654/ARA_DATA/A23/10pct_verify_try2/ProcessedFile/data_filterproblems100_A${station}_${year}.txt"
	readfile=../../step1-make_ped_pairs/A${station}_${year}_File_Ped_Pairs_pitzer_short.txt
	err_out_location=/fs/scratch/PAS0654/ara/10pct/err_out_logs
	err_out_location=/fs/project/PAS0654/ARA_DATA/A23/10pct_verify_try2/err_out_log
	walltime=00:02:00
fi

#where should the outputs be stored?
echo '[ Output directory: ' $OutputDir ' ]'
export OutputDir

RunDir="/users/PAS0654/osu0673/A23_analysis_new2/AraRoot"
echo '[ RunDir: ' $RunDir ' ]'
export RunDir

LaunchDir="/users/PAS0654/osu0673/A23_analysis_new2/a23_analysis_scripts/osc_scripts/run_diffuse/10pct/step4-reco/v2_multi_owens"
echo '[ LaunchDir: ' $LaunchDir ' ]'
export LaunchDir

#we have to define where in the list of data files we want to start
FileNumberStart=0
FileNumberEnd=40

# readfile=../A${station}_${year}_MergedFiles_owens.txt

FileNumber=0
while read line1 && read line2 && read line3 && read line4 && read line5 && read line6 && read line7 && read line8 && read line9 && read line10 && read line11 && read line12 && read line13 && read line14 && read line15 && read line16 && read line17 && read line18 && read line19 && read line20 && read line21 && read line22 && read line23 && read line24 && read line25 && read line26 && read line27 && read line28 && read line29 && read line30 && read line31 && read line32 && read line33 && read line34 && read line35 && read line36 && read line37 && read line38 && read line39 && read line40
do

	if (( $FileNumber >= $FileNumberStart && $FileNumber <= $FileNumberEnd ))
	then

		sa1=($line1)
		f1=${sa1[0]}
		p1=${sa1[1]}

		echo $f1
		echo $p1

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

		sa29=($line29)
		f29=${sa29[0]}
		p29=${sa29[0]}

		sa30=($line30)
		f30=${sa30[0]}
		p30=${sa30[0]}

		sa31=($line31)
		f31=${sa31[0]}
		p31=${sa31[0]}

		sa32=($line32)
		f32=${sa32[0]}
		p32=${sa32[0]}

		sa33=($line33)
		f33=${sa33[0]}
		p33=${sa33[0]}

		sa34=($line34)
		f34=${sa34[0]}
		p34=${sa34[0]}

		sa35=($line35)
		f35=${sa35[0]}
		p35=${sa35[0]}

		sa36=($line36)
		f36=${sa36[0]}
		p36=${sa36[0]}

		sa37=($line37)
		f37=${sa37[0]}
		p37=${sa37[0]}

		sa38=($line38)
		f38=${sa38[0]}
		p38=${sa38[0]}

		sa39=($line39)
		f39=${sa39[0]}
		p39=${sa39[0]}

		sa40=($line40)
		f40=${sa40[0]}
		p40=${sa40[0]}

		if [ $simulation == '0' ] #is no simulation
		then
		    echo "hi"
			#qsub -A $account -l walltime=$walltime -e $err_out_location -o $err_out_location -v FILTERDIR=$FilterDir,ERRFILE=$ErrFile,LAUNCHDIR=$LaunchDir,RUNDIR=$RunDir,OUTPUTDIR=$OutputDir,DROPCHANS=$DropBadChans,STATION=$station,YEAR=$year,CONFIG=$config,ENERGY=$energy,SIMULATION=$simulation,F1=$f1,P1=$p1,F2=$f2,P2=$p2,F3=$f3,P3=$p3,F4=$f4,P4=$p4,F5=$f5,P5=$p5,F6=$f6,P6=$p6,F7=$f7,P7=$p7,F8=$f8,P8=$p8,F9=$f9,P9=$p9,F10=$f10,P10=$p10,F11=$f11,P11=$p11,F12=$f12,P12=$p12,F13=$f13,P13=$p13,F14=$f14,P14=$p14,F15=$f15,P15=$p15,F16=$f16,P16=$p16,F17=$f17,P17=$p17,F18=$f18,P18=$p18,F19=$f19,P19=$p19,F20=$f20,P20=$p20,F21=$f21,P21=$p21,F22=$f22,P22=$p22,F23=$f23,P23=$p23,F24=$f24,P24=$p24,F25=$f25,P25=$p25,F26=$f26,P26=$p26,F27=$f27,P27=$p27,F28=$f28,P28=$p28,F29=$f29,P29=$p29,F30=$f30,P30=$p30,F31=$f31,P31=$p31,F32=$f32,P32=$p32,F33=$f33,P33=$p33,F34=$f34,P34=$p34,F35=$f35,P35=$p35,F36=$f36,P36=$p36,F37=$f37,P37=$p37,F38=$f38,P38=$p38,F39=$f39,P39=$p39,F40=$f40,P40=$p40 -N 'pitzer_multi40_A'$station'_'$year'_'$FileNumber'_datareco10verify' pitzer_run.sh
	
		elif [ $simulation == '1' ] #is simulation
		then
			qsub -A $account -l walltime=$walltime -e $err_out_location -o $err_out_location -v FILTERDIR=$FilterDir,ERRFILE=$ErrFile,LAUNCHDIR=$LaunchDir,RUNDIR=$RunDir,OUTPUTDIR=$OutputDir,DROPCHANS=$DropBadChans,STATION=$station,YEAR=$year,CONFIG=$config,ENERGY=$energy,SIMULATION=$simulation,F1=$f1,P1=$p1,F2=$f2,P2=$p2,F3=$f3,P3=$p3,F4=$f4,P4=$p4,F5=$f5,P5=$p5,F6=$f6,P6=$p6,F7=$f7,P7=$p7,F8=$f8,P8=$p8,F9=$f9,P9=$p9,F10=$f10,P10=$p10,F11=$f11,P11=$p11,F12=$f12,P12=$p12,F13=$f13,P13=$p13,F14=$f14,P14=$p14,F15=$f15,P15=$p15,F16=$f16,P16=$p16,F17=$f17,P17=$p17,F18=$f18,P18=$p18,F19=$f19,P19=$p19,F20=$f20,P20=$p20,F21=$f21,P21=$p21,F22=$f22,P22=$p22,F23=$f23,P23=$p23,F24=$f24,P24=$p24,F25=$f25,P25=$p25,F26=$f26,P26=$p26,F27=$f27,P27=$p27,F28=$f28,P28=$p28,F29=$f29,P29=$p29,F30=$f30,P30=$p30,F31=$f31,P31=$p31,F32=$f32,P32=$p32,F33=$f33,P33=$p33,F34=$f34,P34=$p34,F35=$f35,P35=$p35,F36=$f36,P36=$p36,F37=$f37,P37=$p37,F38=$f38,P38=$p38,F39=$f39,P39=$p39,F40=$f40,P40=$p40 -N 'pitzer_multi40_A'$station'_c'$config'_E'$energy'_'$FileNumber'_simreco10verify' pitzer_run.sh
		fi
		echo "-----------------------------------"
	fi

	FileNumber=$((FileNumber+40))

done < $readfile
