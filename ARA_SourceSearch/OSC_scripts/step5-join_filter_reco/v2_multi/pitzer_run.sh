#/bin/bash
#PBS -l nodes=1:ppn=10

cd $LAUNCHDIR

./pitzer_doThis.sh $STATION $TMPDIR $PROCDIR $F1 &
declare pid_1=$!
declare F_1=$F1
./pitzer_doThis.sh $STATION $TMPDIR $PROCDIR $F2 &
declare pid_2=$!
declare F_2=$F2
./pitzer_doThis.sh $STATION $TMPDIR $PROCDIR $F3 &
declare pid_3=$!
declare F_3=$F3
./pitzer_doThis.sh $STATION $TMPDIR $PROCDIR $F4 &
declare pid_4=$!
declare F_4=$F4
./pitzer_doThis.sh $STATION $TMPDIR $PROCDIR $F5 &
declare pid_5=$!
declare F_5=$F5
./pitzer_doThis.sh $STATION $TMPDIR $PROCDIR $F6 &
declare pid_6=$!
declare F_6=$F6
./pitzer_doThis.sh $STATION $TMPDIR $PROCDIR $F7 &
declare pid_7=$!
declare F_7=$F7
./pitzer_doThis.sh $STATION $TMPDIR $PROCDIR $F8 &
declare pid_8=$!
declare F_8=$F8
./pitzer_doThis.sh $STATION $TMPDIR $PROCDIR $F9 &
declare pid_9=$!
declare F_9=$F9
./pitzer_doThis.sh $STATION $TMPDIR $PROCDIR $F10 &
declare pid_10=$!
declare F_10=$F10
# ./pitzer_doThis.sh $STATION $TMPDIR $PROCDIR $F11 &
# declare pid_11=$!
# declare F_11=$F11
# ./pitzer_doThis.sh $STATION $TMPDIR $PROCDIR $F12 &
# declare pid_12=$!
# declare F_12=$F12
# ./pitzer_doThis.sh $STATION $TMPDIR $PROCDIR $F13 &
# declare pid_13=$!
# declare F_13=$F13
# ./pitzer_doThis.sh $STATION $TMPDIR $PROCDIR $F14 &
# declare pid_14=$!
# declare F_14=$F14
# ./pitzer_doThis.sh $STATION $TMPDIR $PROCDIR $F15 &
# declare pid_15=$!
# declare F_15=$F15
# ./pitzer_doThis.sh $STATION $TMPDIR $PROCDIR $F16 &
# declare pid_16=$!
# declare F_16=$F16
# ./pitzer_doThis.sh $STATION $TMPDIR $PROCDIR $F17 &
# declare pid_17=$!
# declare F_17=$F17
# ./pitzer_doThis.sh $STATION $TMPDIR $PROCDIR $F18 &
# declare pid_18=$!
# declare F_18=$F18
# ./pitzer_doThis.sh $STATION $TMPDIR $PROCDIR $F19 &
# declare pid_19=$!
# declare F_19=$F19
# ./pitzer_doThis.sh $STATION $TMPDIR $PROCDIR $F20 &
# declare pid_20=$!
# declare F_20=$F20
# ./pitzer_doThis.sh $STATION $TMPDIR $PROCDIR $F21 &
# declare pid_21=$!
# declare F_21=$F21
# ./pitzer_doThis.sh $STATION $TMPDIR $PROCDIR $F22 &
# declare pid_22=$!
# declare F_22=$F22
# ./pitzer_doThis.sh $STATION $TMPDIR $PROCDIR $F23 &
# declare pid_23=$!
# declare F_23=$F23
# ./pitzer_doThis.sh $STATION $TMPDIR $PROCDIR $F24 &
# declare pid_24=$!
# declare F_24=$F24
# ./pitzer_doThis.sh $STATION $TMPDIR $PROCDIR $F25 &
# declare pid_25=$!
# declare F_25=$F25
# ./pitzer_doThis.sh $STATION $TMPDIR $PROCDIR $F26 &
# declare pid_26=$!
# declare F_26=$F26
# ./pitzer_doThis.sh $STATION $TMPDIR $PROCDIR $F27 &
# declare pid_27=$!
# declare F_27=$F27
# ./pitzer_doThis.sh $STATION $TMPDIR $PROCDIR $F28 &
# declare pid_28=$!
# declare F_28=$F28
# ./pitzer_doThis.sh $STATION $TMPDIR $PROCDIR $F29 &
# declare pid_29=$!
# declare F_29=$F29
# ./pitzer_doThis.sh $STATION $TMPDIR $PROCDIR $F30 &
# declare pid_30=$!
# declare F_30=$F30
# ./pitzer_doThis.sh $STATION $TMPDIR $PROCDIR $F31 &
# declare pid_31=$!
# declare F_31=$F31
# ./pitzer_doThis.sh $STATION $TMPDIR $PROCDIR $F32 &
# declare pid_32=$!
# declare F_32=$F32
# ./pitzer_doThis.sh $STATION $TMPDIR $PROCDIR $F33 &
# declare pid_33=$!
# declare F_33=$F33
# ./pitzer_doThis.sh $STATION $TMPDIR $PROCDIR $F34 &
# declare pid_34=$!
# declare F_34=$F34
# ./pitzer_doThis.sh $STATION $TMPDIR $PROCDIR $F35 &
# declare pid_35=$!
# declare F_35=$F35
# ./pitzer_doThis.sh $STATION $TMPDIR $PROCDIR $F36 &
# declare pid_36=$!
# declare F_36=$F36
# ./pitzer_doThis.sh $STATION $TMPDIR $PROCDIR $F37 &
# declare pid_37=$!
# declare F_37=$F37
# ./pitzer_doThis.sh $STATION $TMPDIR $PROCDIR $F38 &
# declare pid_38=$!
# declare F_38=$F38
# ./pitzer_doThis.sh $STATION $TMPDIR $PROCDIR $F39 &
# declare pid_39=$!
# declare F_39=$F39
# ./pitzer_doThis.sh $STATION $TMPDIR $PROCDIR $F40 &
# declare pid_40=$!
# declare F_40=$F40

for i in `seq 1 10`
do
	declare val=pid_$i
	wait ${!val}
	declare ret_$i=$?
done

for i in `seq 1 10`
do
	declare val=ret_$i
	if [ ${!val} -ne 0 ] #error handle
	then
		declare trouble_file=F_$i
		echo "${!trouble_file}" >> $ERRFILE
	fi
done

pbsdcp $TMPDIR/'*.root' $OUTPUTDIR