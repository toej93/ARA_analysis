#!/bin/bash
eval 'source /users/PAS0654/osu0673/A23_analysis_new2/env.sh'
cd $RUNDIR
./bin/v2_Reco100 $1 $2 $3 $4 $5 $6 $7

#./bin/v2_Reco100 <1-simulation_flag> <2-station> <3-year/config> <4-filter_file_dir> <5-output directory> <6-input file> <7-pedestal file> 
