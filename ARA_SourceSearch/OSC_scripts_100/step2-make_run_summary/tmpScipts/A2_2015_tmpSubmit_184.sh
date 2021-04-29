#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1008/run006301/event006301.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006299.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1008/run006302/event006302.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006299.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1008/run006303/event006303.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006299.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1009/run006305/event006305.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006304.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1009/run006306/event006306.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006304.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1009/run006307/event006307.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006304.dat &
wait
