#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0522/run007300/event007300.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007297.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0522/run007301/event007301.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007297.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0522/run007303/event007303.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007302.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0523/run007304/event007304.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007302.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0523/run007305/event007305.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007302.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0523/run007306/event007306.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007302.dat &
wait
