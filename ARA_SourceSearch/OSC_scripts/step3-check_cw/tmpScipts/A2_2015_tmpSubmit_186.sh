#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0903/run006130/event006130.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006129.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0904/run006131/event006131.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006129.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0904/run006132/event006132.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006129.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0904/run006133/event006133.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006129.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0904/run006135/event006135.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006134.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0905/run006136/event006136.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006134.dat &
wait
