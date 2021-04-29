#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0520/run003623/event003623.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003621.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0520/run003624/event003624.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003621.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0520/run003625/event003625.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003621.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0520/run003627/event003627.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003626.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0521/run003628/event003628.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003626.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0521/run003629/event003629.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003626.dat &
wait
