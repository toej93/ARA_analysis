#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=02:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0803/run004008/event004008.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004005.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0803/run004009/event004009.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004005.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0803/run004011/event004011.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004010.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0804/run004012/event004012.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004010.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0804/run004013/event004013.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004010.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0804/run004014/event004014.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004010.dat &
wait
