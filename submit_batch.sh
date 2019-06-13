#!/bin/bash

#declare -a arr=("17" "17.5" "18" "18.5" "19" "19.5" "20" "20.5" "21")
declare -a arr=("17.0" "18.0" "19.0" "20.0")
#declare -a arr=("17.0")

for i in "${arr[@]}"
do
    AraSimDir='/users/PAS0654/osu8354/ARA/AraSim/AraSim_versions/ARA03_type_2'
    SetUpFile='/users/PAS0654/osu8354/ARA/AraSim/AraSim_versions/setups/monoE/A3_c2_E'$i'.txt'
    #SetUpFile='/users/PAS0654/osu8354/ARA/AraSim/trunk/setup_'$i'_th_stdnoise.txt'
    #OutputDir='/users/PAS0654/osu8354/ARA/AraSim/trunk/outputs/'
    OutputDir='/fs/scratch/PAS0654/jorge/sim_results/A3_c2/'
    export AraSimDir
    export SetUpFile
    export OutputDir
    
    echo ""
    echo "--------------------------------------------"
    echo "----- Preparing to batch submit AraSim "
    echo "----- "
    echo "----- AraSimDir: " $AraSimDir
    echo "----- SetUpFile: " $SetUpFile
    echo "----- outputDir: " $OutputDir
    echo "----- "
    echo "--------------------------------------------"
    echo ""
    
    #	read -p "Press Enter to run! " RUNNOW
    
    qsub -v INPUTFILE=$SetUpFile,RUN_DIR=$AraSimDir,OUTPUT_DIR=$OutputDir -N AraSim_A3_c2_E"$i" run_AraSim.sh
    
    
    #sed -i '$ a RAY_TRACE_ICE_MODEL_PARAMS=2' des* #append to last line
    #sed -i 's/old-text/new-text/g' input.txt
    
done
