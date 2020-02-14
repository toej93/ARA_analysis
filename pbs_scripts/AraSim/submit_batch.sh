#!/bin/bash

declare -a arr=("up" "low")
# declare -a arr=("17.0" "18.0" "19.0" "20.0")
#declare -a arr=("17.0")

for j in "${arr[@]}"
do
  for i in $(seq 560 5 610)
  do
      AraSimDir='/users/PAS0654/osu8354/AraSim'
      SetUpFile='/users/PAS0654/osu8354/ARA/AraSim/AraSim_versions/a23_4yr_diffuse_simconfigs/Latten/Latten_'$j'_A2_c1_E'$i'.txt'
      #SetUpFile='/users/PAS0654/osu8354/ARA/AraSim/trunk/setup_'$i'_th_stdnoise.txt'
      #OutputDir='/users/PAS0654/osu8354/ARA/AraSim/trunk/outputs/'
      OutputDir='/fs/scratch/PAS0654/jorge/sim_results/Latten_'$j'/'
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

      qsub -v INPUTFILE=$SetUpFile,RUN_DIR=$AraSimDir,OUTPUT_DIR=$OutputDir -N AraSim_A2_Latten_"$j"_E"$i" run_AraSim.sh


      #sed -i '$ a RAY_TRACE_ICE_MODEL_PARAMS=2' des* #append to last line
      #sed -i 's/old-text/new-text/g' input.txt

  done
done
