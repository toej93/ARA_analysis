#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0225/run003104/event003104.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003102.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0225/run003105/event003105.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003102.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0226/run003106/event003106.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003102.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0226/run003108/event003108.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003107.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0226/run003109/event003109.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003107.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0226/run003110/event003110.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003107.dat &
wait
