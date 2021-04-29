#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0209/run006848/event006848.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006844.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0209/run006850/event006850.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006849.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0209/run006851/event006851.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006849.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0210/run006852/event006852.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006849.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0210/run006853/event006853.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006849.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0210/run006855/event006855.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006854.dat &
wait
