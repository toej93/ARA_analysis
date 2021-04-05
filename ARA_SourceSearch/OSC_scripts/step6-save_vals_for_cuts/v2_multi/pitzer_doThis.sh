#!/bin/bash
eval 'source /users/PAS0654/osu0673/A23_analysis_new2/env.sh'
cd $RUNDIR
./bin/v2_SaveVals100 $1 $2 $3 $4 $5 $6 $7 $8 $9 ${10} ${11} ${12} ${13}

# ./bin/v2_SaveVals100 
# 1 <isSim?> 
# 2 <station> 
# 3 <config> 
# 4 <year_or_energy (as float, eg 17.0 or 18.5)> 
# 5 <drop_bad_chan> 
# 6 <output_location> 
# 7 <data_directory> 
# 8 <cw_directory>
# 9 <V SNR bin> 
# 10 <H SNR bin> 
# 11 <V WFRMS val> 
# 12 <H WFRMS val> 
# 13 <joined filename 1> <joined filename 2 > ... <joined filename x>