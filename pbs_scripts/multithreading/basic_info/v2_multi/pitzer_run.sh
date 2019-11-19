#/bin/bash
#PBS -l nodes=1:ppn=5

cd $LAUNCHDIR

./pitzer_doThis.sh $STATION $CONFIG $F1 &
declare pid_1=$!
declare F_1=$F1
./pitzer_doThis.sh $STATION $CONFIG $F2 &
declare pid_2=$!
declare F_2=$F2
./pitzer_doThis.sh $STATION $CONFIG $F3 &
declare pid_3=$!
declare F_3=$F3
./pitzer_doThis.sh $STATION $CONFIG $F4 &
declare pid_4=$!
declare F_4=$F4
./pitzer_doThis.sh $STATION $CONFIG $F5 &
declare pid_5=$!
declare F_5=$F5
# ./pitzer_doThis.sh $STATION $F6 $TMPDIR &
# declare pid_6=$!
# declare F_6=$F6
# ./pitzer_doThis.sh $STATION $F7 $TMPDIR &
# declare pid_7=$!
# declare F_7=$F7
# ./pitzer_doThis.sh $STATION $F8 $TMPDIR &
# declare pid_8=$!
# declare F_8=$F8
# ./pitzer_doThis.sh $STATION $F9 $TMPDIR &
# declare pid_9=$!
# declare F_9=$F9
# ./pitzer_doThis.sh $STATION $F10 $TMPDIR &
# declare pid_10=$!
# declare F_10=$F10
# ./pitzer_doThis.sh $STATION $F11 $TMPDIR &
# declare pid_11=$!
# declare F_11=$F11
# ./pitzer_doThis.sh $STATION $F12 $TMPDIR &
# declare pid_12=$!
# declare F_12=$F12
# ./pitzer_doThis.sh $STATION $F13 $TMPDIR &
# declare pid_13=$!
# declare F_13=$F13
# ./pitzer_doThis.sh $STATION $F14 $TMPDIR &
# declare pid_14=$!
# declare F_14=$F14
# ./pitzer_doThis.sh $STATION $F15 $TMPDIR &
# declare pid_15=$!
# declare F_15=$F15
# ./pitzer_doThis.sh $STATION $F16 $TMPDIR &
# declare pid_16=$!
# declare F_16=$F16
# ./pitzer_doThis.sh $STATION $F17 $TMPDIR &
# declare pid_17=$!
# declare F_17=$F17
# ./pitzer_doThis.sh $STATION $F18 $TMPDIR &
# declare pid_18=$!
# declare F_18=$F18
# ./pitzer_doThis.sh $STATION $F19 $TMPDIR &
# declare pid_19=$!
# declare F_19=$F19
# ./pitzer_doThis.sh $STATION $F20 $TMPDIR &
# declare pid_20=$!
# declare F_20=$F20
# ./pitzer_doThis.sh $STATION $F21 $TMPDIR &
# declare pid_21=$!
# declare F_21=$F21
# ./pitzer_doThis.sh $STATION $F22 $TMPDIR &
# declare pid_22=$!
# declare F_22=$F22
# ./pitzer_doThis.sh $STATION $F23 $TMPDIR &
# declare pid_23=$!
# declare F_23=$F23
# ./pitzer_doThis.sh $STATION $F24 $TMPDIR &
# declare pid_24=$!
# declare F_24=$F24
# ./pitzer_doThis.sh $STATION $F25 $TMPDIR &
# declare pid_25=$!
# declare F_25=$F25
# ./pitzer_doThis.sh $STATION $F26 $TMPDIR &
# declare pid_26=$!
# declare F_26=$F26
# ./pitzer_doThis.sh $STATION $F27 $TMPDIR &
# declare pid_27=$!
# declare F_27=$F27
# ./pitzer_doThis.sh $STATION $F28 $TMPDIR &
# declare pid_28=$!
# declare F_28=$F28
# ./pitzer_doThis.sh $STATION $F29 $TMPDIR &
# declare pid_29=$!
# declare F_29=$F29
# ./pitzer_doThis.sh $STATION $F30 $TMPDIR &
# declare pid_30=$!
# declare F_30=$F30
# ./pitzer_doThis.sh $STATION $F31 $TMPDIR &
# declare pid_31=$!
# declare F_31=$F31
# ./pitzer_doThis.sh $STATION $F32 $TMPDIR &
# declare pid_32=$!
# declare F_32=$F32
# ./pitzer_doThis.sh $STATION $F33 $TMPDIR &
# declare pid_33=$!
# declare F_33=$F33
# ./pitzer_doThis.sh $STATION $F34 $TMPDIR &
# declare pid_34=$!
# declare F_34=$F34
# ./pitzer_doThis.sh $STATION $F35 $TMPDIR &
# declare pid_35=$!
# declare F_35=$F35
# ./pitzer_doThis.sh $STATION $F36 $TMPDIR &
# declare pid_36=$!
# declare F_36=$F36
# ./pitzer_doThis.sh $STATION $F37 $TMPDIR &
# declare pid_37=$!
# declare F_37=$F37
# ./pitzer_doThis.sh $STATION $F38 $TMPDIR &
# declare pid_38=$!
# declare F_38=$F38
# ./pitzer_doThis.sh $STATION $F39 $TMPDIR &
# declare pid_39=$!
# declare F_39=$F39
# ./pitzer_doThis.sh $STATION $F40 $TMPDIR &
# declare pid_40=$!
# declare F_40=$F40

for i in `seq 1 5`
do
	declare val=pid_$i
	wait ${!val}
	declare ret_$i=$?
done

for i in `seq 1 5`
do
	declare val=ret_$i
	if [ ${!val} -ne 0 ] #error handle
	then
		declare trouble_file=F_$i
		echo "${!trouble_file}" >> $ERRFILE
	fi
done

pbsdcp $TMPDIR/'*.root' $OUTPUTDIR
