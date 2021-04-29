#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1101/run006421/event006421.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006419.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1101/run006422/event006422.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006419.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1101/run006423/event006423.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006419.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1101/run006425/event006425.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006424.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1102/run006426/event006426.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006424.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1102/run006427/event006427.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006424.dat &
wait
