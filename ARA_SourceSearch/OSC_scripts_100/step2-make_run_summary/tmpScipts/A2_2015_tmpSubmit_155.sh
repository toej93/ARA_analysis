#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0824/run006078/event006078.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006074.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0824/run006080/event006080.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006079.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0825/run006081/event006081.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006079.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0825/run006082/event006082.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006079.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0825/run006083/event006083.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006079.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0825/run006085/event006085.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006084.dat &
wait
