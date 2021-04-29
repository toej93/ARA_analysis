#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0107/run006679/event006679.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006676.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0107/run006680/event006680.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006676.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0107/run006682/event006682.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006681.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0108/run006683/event006683.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006681.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0108/run006684/event006684.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006681.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0108/run006685/event006685.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006681.dat &
wait
