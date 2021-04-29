#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1023/run004292/event004292.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004290.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1023/run004414/event004414.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004410.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1023/run004417/event004417.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004415.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1023/run004418/event004418.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004415.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1024/run004293/event004293.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004290.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1024/run004294/event004294.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004290.dat &
wait
