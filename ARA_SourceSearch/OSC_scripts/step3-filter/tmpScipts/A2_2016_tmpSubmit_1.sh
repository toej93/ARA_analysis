#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=02:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0102/run006656/event006656.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006651.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0102/run006657/event006657.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006651.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0103/run006658/event006658.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006651.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0103/run006660/event006660.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006659.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0103/run006662/event006662.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006659.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0104/run006663/event006663.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006659.dat &
wait
