#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0101/run006648/event006648.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006646.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0101/run006649/event006649.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006646.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0101/run006650/event006650.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006646.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0101/run006652/event006652.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006651.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0102/run006654/event006654.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006651.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0102/run006655/event006655.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006651.dat &
wait
