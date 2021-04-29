#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/1021/run008118/event008118.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run008117.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/1021/run008119/event008119.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run008117.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/1021/run008120/event008120.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run008117.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/1022/run008121/event008121.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run008117.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/1022/run008123/event008123.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run008122.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/1022/run008124/event008124.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run008122.dat &
wait
