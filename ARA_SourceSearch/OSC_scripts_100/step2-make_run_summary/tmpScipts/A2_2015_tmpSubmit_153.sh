#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0821/run006063/event006063.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006059.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0821/run006065/event006065.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006064.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0822/run006066/event006066.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006064.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0822/run006067/event006067.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006064.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0822/run006068/event006068.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006064.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0822/run006070/event006070.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006069.dat &
wait
