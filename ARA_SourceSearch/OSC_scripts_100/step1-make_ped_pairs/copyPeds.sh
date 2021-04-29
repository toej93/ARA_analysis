#loop over every line in the pedestal pair files
while read line; do
	if [[ "$line" =~ 'pedestalValues' ]]; then #if the line contains the word "pesetalValues"
		echo "Pedestal specified!"
		new=${line%%.*} # retain the part before the last dot
		runName=${new##*/}  # retain the part after the last slash
		
		runNoWithZero=${runName#event} #strip down to just XXXX (no _ version)

		#comment out the following line if you don't want to strip leading zeros
		runNo=$(echo $runNoWithZero | sed 's/^0*//') #remove leading zeros	
		
#		new_save='/fs/scratch/PAS0654/ara/peds/run_specific_peds/A3/all_peds/event'$runNo'_specificPeds.dat' #make a new filename
		new_save='/fs/project/PAS0654/ARA_DATA/A23/peds/run_specific_peds/A2/all_peds/event'$runNo'_specificPeds.dat'
		echo 'new save name: ' $new_save
		pedName=${line#* }
		echo 'ped name: ' $pedName
		ln -s $pedName $new_save
	else
		echo "Pedestal not specified; nothing to be done."
	fi
done <A2_2016_File_Ped_Pairs.txt
