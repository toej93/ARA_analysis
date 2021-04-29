#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0828/run004137/event004137.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004133.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0828/run004139/event004139.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004138.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0828/run004140/event004140.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004138.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0828/run004141/event004141.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004138.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0829/run004142/event004142.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004138.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0829/run004150/event004150.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004138.dat &
wait
