#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2423/event2423.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002420/pedestalValues.run002420.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2424/event2424.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002420/pedestalValues.run002420.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2426/event2426.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002420/pedestalValues.run002420.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2427/event2427.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002420/pedestalValues.run002420.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2428/event2428.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002420/pedestalValues.run002420.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2429/event2429.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002420/pedestalValues.run002420.dat &
wait
