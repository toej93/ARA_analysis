#/bin/bash
#PBS -l nodes=1:ppn=1

#./bin/v2_Reco100 <1-simulation_flag> <2-station> <3-year/YEAR> <4-filter_file_dir> <5-output directory> <6-input file> <7-pedestal file> 

cd $LAUNCHDIR

./owens_doThis.sh $SIMULATION $STATION $YEAR $FILTERDIR $TMPDIR $F1 $P1 &
declare pid_1=$!
declare F_1=$F1
# ./owens_doThis.sh $SIMULATION $STATION $YEAR $FILTERDIR $TMPDIR $F2 $P2 &
# declare pid_2=$!
# declare F_2=$F2
# ./owens_doThis.sh $SIMULATION $STATION $YEAR $FILTERDIR $TMPDIR $F3 $P3 &
# declare pid_3=$!
# declare F_3=$F3
# ./owens_doThis.sh $SIMULATION $STATION $YEAR $FILTERDIR $TMPDIR $F4 $P4 &
# declare pid_4=$!
# declare F_4=$F4
# ./owens_doThis.sh $SIMULATION $STATION $YEAR $FILTERDIR $TMPDIR $F5 $P5 &
# declare pid_5=$!
# declare F_5=$F5
# ./owens_doThis.sh $SIMULATION $STATION $YEAR $FILTERDIR $TMPDIR $F6 $P6 &
# declare pid_6=$!
# declare F_6=$F6
# ./owens_doThis.sh $SIMULATION $STATION $YEAR $FILTERDIR $TMPDIR $F7 $P7 &
# declare pid_7=$!
# declare F_7=$F7
# ./owens_doThis.sh $SIMULATION $STATION $YEAR $FILTERDIR $TMPDIR $F8 $P8 &
# declare pid_8=$!
# declare F_8=$F8
# ./owens_doThis.sh $SIMULATION $STATION $YEAR $FILTERDIR $TMPDIR $F9 $P9 &
# declare pid_9=$!
# declare F_9=$F9
# ./owens_doThis.sh $SIMULATION $STATION $YEAR $FILTERDIR $TMPDIR $F10 $P10 &
# declare pid_10=$!
# declare F_10=$F10
# ./owens_doThis.sh $SIMULATION $STATION $YEAR $FILTERDIR $TMPDIR $F11 $P11 &
# declare pid_11=$!
# declare F_11=$F11
# ./owens_doThis.sh $SIMULATION $STATION $YEAR $FILTERDIR $TMPDIR $F12 $P12 &
# declare pid_12=$!
# declare F_12=$F12
# ./owens_doThis.sh $SIMULATION $STATION $YEAR $FILTERDIR $TMPDIR $F13 $P13 &
# declare pid_13=$!
# declare F_13=$F13
# ./owens_doThis.sh $SIMULATION $STATION $YEAR $FILTERDIR $TMPDIR $F14 $P14 &
# declare pid_14=$!
# declare F_14=$F14
# ./owens_doThis.sh $SIMULATION $STATION $YEAR $FILTERDIR $TMPDIR $F15 $P15 &
# declare pid_15=$!
# declare F_15=$F15
# ./owens_doThis.sh $SIMULATION $STATION $YEAR $FILTERDIR $TMPDIR $F16 $P16 &
# declare pid_16=$!
# declare F_16=$F16
# ./owens_doThis.sh $SIMULATION $STATION $YEAR $FILTERDIR $TMPDIR $F17 $P17 &
# declare pid_17=$!
# declare F_17=$F17
# ./owens_doThis.sh $SIMULATION $STATION $YEAR $FILTERDIR $TMPDIR $F18 $P18 &
# declare pid_18=$!
# declare F_18=$F18
# ./owens_doThis.sh $SIMULATION $STATION $YEAR $FILTERDIR $TMPDIR $F19 $P19 &
# declare pid_19=$!
# declare F_19=$F19
# ./owens_doThis.sh $SIMULATION $STATION $YEAR $FILTERDIR $TMPDIR $F20 $P20 &
# declare pid_20=$!
# declare F_20=$F20
# ./owens_doThis.sh $SIMULATION $STATION $YEAR $FILTERDIR $TMPDIR $F21 $P21 &
# declare pid_21=$!
# declare F_21=$F21
# ./owens_doThis.sh $SIMULATION $STATION $YEAR $FILTERDIR $TMPDIR $F22 $P22 &
# declare pid_22=$!
# declare F_22=$F22
# ./owens_doThis.sh $SIMULATION $STATION $YEAR $FILTERDIR $TMPDIR $F23 $P23 &
# declare pid_23=$!
# declare F_23=$F23
# ./owens_doThis.sh $SIMULATION $STATION $YEAR $FILTERDIR $TMPDIR $F24 $P24 &
# declare pid_24=$!
# declare F_24=$F24
# ./owens_doThis.sh $SIMULATION $STATION $YEAR $FILTERDIR $TMPDIR $F25 $P25 &
# declare pid_25=$!
# declare F_25=$F25
# ./owens_doThis.sh $SIMULATION $STATION $YEAR $FILTERDIR $TMPDIR $F26 $P26 &
# declare pid_26=$!
# declare F_26=$F26
# ./owens_doThis.sh $SIMULATION $STATION $YEAR $FILTERDIR $TMPDIR $F27 $P27 &
# declare pid_27=$!
# declare F_27=$F27
# ./owens_doThis.sh $SIMULATION $STATION $YEAR $FILTERDIR $TMPDIR $F28 $P28 &
# declare pid_28=$!
# declare F_28=$F28


for i in `seq 1 1`
do
	declare val=pid_$i
	wait ${!val}
	declare ret_$i=$?
done

for i in `seq 1 1`
do
	declare val=ret_$i
	if [ ${!val} -ne 0 ] #error handle
	then
		declare trouble_file=F_$i
		echo "${!trouble_file}" >> $ERRFILE
	fi
done

pbsdcp $TMPDIR/'*.root' $OUTPUTDIR