#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1018/run004392/event004392.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004390.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1018/run004393/event004393.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004390.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1018/run004394/event004394.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004390.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1019/run004396/event004396.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004395.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1019/run004397/event004397.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004395.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1019/run004398/event004398.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004395.dat &
wait
