#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2673/event2673.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002670/pedestalValues.run002670.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2674/event2674.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002670/pedestalValues.run002670.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2676/event2676.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002670/pedestalValues.run002670.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2677/event2677.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002670/pedestalValues.run002670.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2678/event2678.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002670/pedestalValues.run002670.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2679/event2679.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002670/pedestalValues.run002670.dat &
wait
