#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=02:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1101/run004357/event004357.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004355.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1101/run004358/event004358.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004355.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1101/run004359/event004359.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004355.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1101/run004459/event004459.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004455.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1101/run004461/event004461.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004460.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1101/run004462/event004462.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004460.dat &
wait
