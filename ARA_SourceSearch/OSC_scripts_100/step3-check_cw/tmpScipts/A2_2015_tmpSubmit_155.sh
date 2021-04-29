#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0718/run005892/event005892.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005888.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0718/run005894/event005894.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005893.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0718/run005895/event005895.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005893.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0718/run005896/event005896.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005893.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0719/run005897/event005897.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005893.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0719/run005899/event005899.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005898.dat &
wait
