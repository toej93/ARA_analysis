#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1007/run004342/event004342.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004340.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1008/run004343/event004343.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004340.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1008/run004344/event004344.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004340.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1008/run004346/event004346.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004345.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1008/run004347/event004347.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004345.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1009/run004348/event004348.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004345.dat &
wait
