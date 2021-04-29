#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0820/run004100/event004100.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004098.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0820/run004101/event004101.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004098.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0820/run004102/event004102.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004098.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0821/run004104/event004104.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004103.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0821/run004105/event004105.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004103.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0821/run004106/event004106.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004103.dat &
wait
