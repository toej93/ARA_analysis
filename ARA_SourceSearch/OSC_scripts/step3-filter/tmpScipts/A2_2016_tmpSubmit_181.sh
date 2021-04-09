#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=02:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/1102/run008178/event008178.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run008175.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/1102/run008179/event008179.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run008175.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/1103/run008181/event008181.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run008180.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/1103/run008182/event008182.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run008180.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/1103/run008183/event008183.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run008180.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/1103/run008184/event008184.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run008180.dat &
wait
