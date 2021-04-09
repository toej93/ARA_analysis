#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1021/run004281/event004281.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004280.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1021/run004402/event004402.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004400.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1021/run004406/event004406.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004405.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1021/run004407/event004407.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004405.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1021/run004408/event004408.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004405.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1022/run004282/event004282.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004280.dat &
wait
