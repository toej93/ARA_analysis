#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=02:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0925/run004222/event004222.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004220.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0926/run004181/event004181.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004175.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0926/run004214/event004214.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004210.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0927/run004199/event004199.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004195.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0927/run004211/event004211.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004210.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0928/run004188/event004188.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004175.dat &
wait
