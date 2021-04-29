#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0809/run004043/event004043.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004039.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0810/run004037/event004037.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004034.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0810/run004038/event004038.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004034.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0810/run004041/event004041.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004039.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0811/run004046/event004046.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004044.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0811/run004047/event004047.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004044.dat &
wait
