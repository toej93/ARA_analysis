#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=02:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0207/run006841/event006841.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006831.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0208/run006842/event006842.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006831.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0208/run006843/event006843.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006831.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0208/run006845/event006845.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006844.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0208/run006846/event006846.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006844.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0209/run006847/event006847.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006844.dat &
wait
