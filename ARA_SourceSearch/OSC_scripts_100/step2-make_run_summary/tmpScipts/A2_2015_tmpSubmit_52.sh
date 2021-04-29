#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0322/run005301/event005301.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005298.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0322/run005302/event005302.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005298.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0322/run005304/event005304.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005303.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0322/run005305/event005305.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005303.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0323/run005306/event005306.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005303.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0323/run005307/event005307.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005303.dat &
wait
