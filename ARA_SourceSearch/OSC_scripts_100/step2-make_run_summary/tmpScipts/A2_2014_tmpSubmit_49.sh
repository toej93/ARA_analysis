#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0405/run003377/event003377.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003376.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0405/run003378/event003378.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003376.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0406/run003379/event003379.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003376.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0406/run003380/event003380.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003376.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0406/run003382/event003382.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003381.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0406/run003383/event003383.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003381.dat &
wait
