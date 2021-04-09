#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/1018/run008103/event008103.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run008098.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/1018/run008104/event008104.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run008098.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/1018/run008105/event008105.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run008098.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/1019/run008106/event008106.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run008098.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/1019/run008108/event008108.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run008107.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/1019/run008109/event008109.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run008107.dat &
wait
