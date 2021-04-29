#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0217/run005069/event005069.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005066.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0217/run005070/event005070.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005066.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0217/run005072/event005072.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005071.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0217/run005073/event005073.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005071.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0218/run005074/event005074.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005071.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0218/run005075/event005075.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005071.dat &
wait
