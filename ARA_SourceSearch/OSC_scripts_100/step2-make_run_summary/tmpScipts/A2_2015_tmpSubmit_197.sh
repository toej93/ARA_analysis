#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1027/run006398/event006398.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006394.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1027/run006400/event006400.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006399.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1028/run006401/event006401.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006399.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1028/run006402/event006402.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006399.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1028/run006403/event006403.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006399.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1028/run006405/event006405.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006404.dat &
wait
