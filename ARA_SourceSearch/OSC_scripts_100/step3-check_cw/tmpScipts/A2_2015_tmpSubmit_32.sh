#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0131/run004988/event004988.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004986.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0131/run004989/event004989.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004986.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0201/run004990/event004990.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004986.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0201/run004992/event004992.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004991.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0201/run004993/event004993.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004991.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0202/run004994/event004994.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004991.dat &
wait
