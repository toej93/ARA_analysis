#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=02:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0912/run006172/event006172.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006164.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0912/run006173/event006173.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006164.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0912/run006175/event006175.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006174.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0913/run006176/event006176.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006174.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0913/run006177/event006177.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006174.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0913/run006178/event006178.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006174.dat &
wait
