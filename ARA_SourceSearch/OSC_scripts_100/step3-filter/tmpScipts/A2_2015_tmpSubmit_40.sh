#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=02:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0212/run005048/event005048.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005046.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0213/run005049/event005049.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005046.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0213/run005050/event005050.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005046.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0213/run005052/event005052.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005051.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0213/run005053/event005053.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005051.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0214/run005054/event005054.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005051.dat &
wait
