#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0110/run004809/event004809.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004806.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0110/run004810/event004810.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004806.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0110/run004812/event004812.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004811.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0110/run004813/event004813.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004811.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0111/run004814/event004814.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004811.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0111/run004815/event004815.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004811.dat &
wait