#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0411/run005405/event005405.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005403.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0411/run005406/event005406.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005403.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0412/run005407/event005407.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005403.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0412/run005409/event005409.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005408.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0412/run005410/event005410.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005408.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0412/run005411/event005411.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005408.dat &
wait
