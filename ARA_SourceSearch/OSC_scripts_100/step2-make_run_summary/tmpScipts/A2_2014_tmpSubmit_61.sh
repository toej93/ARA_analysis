#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0501/run003508/event003508.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003506.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0501/run003509/event003509.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003506.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0502/run003510/event003510.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003506.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0502/run003512/event003512.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003511.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0502/run003513/event003513.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003511.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0502/run003514/event003514.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003511.dat &
wait
