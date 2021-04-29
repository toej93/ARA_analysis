#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=02:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0819/run006053/event006053.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006049.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0819/run006055/event006055.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006054.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0820/run006056/event006056.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006054.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0820/run006058/event006058.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006054.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0820/run006060/event006060.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006059.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0821/run006061/event006061.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006059.dat &
wait
