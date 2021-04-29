#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0329/run005339/event005339.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005338.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0329/run005340/event005340.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005338.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0330/run005341/event005341.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005338.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0330/run005342/event005342.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005338.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0330/run005344/event005344.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005343.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0330/run005345/event005345.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005343.dat &
wait
