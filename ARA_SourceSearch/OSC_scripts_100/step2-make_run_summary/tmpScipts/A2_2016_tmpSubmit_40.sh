#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0302/run006962/event006962.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006961.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0303/run006963/event006963.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006961.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0303/run006964/event006964.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006961.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0303/run006965/event006965.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006961.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0303/run006967/event006967.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006966.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0304/run006968/event006968.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006966.dat &
wait
