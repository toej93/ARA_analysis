#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0114/run004840/event004840.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004836.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0114/run004842/event004842.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004841.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0114/run004843/event004843.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004841.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0115/run004844/event004844.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004841.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0115/run004845/event004845.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004841.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0115/run004847/event004847.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004846.dat &
wait
