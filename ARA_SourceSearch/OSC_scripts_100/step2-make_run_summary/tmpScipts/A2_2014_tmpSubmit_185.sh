#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1117/run004544/event004544.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004540.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1117/run004546/event004546.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004545.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1118/run004547/event004547.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004545.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1118/run004548/event004548.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004545.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1119/run004551/event004551.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004545.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1119/run004552/event004552.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004545.dat &
wait
