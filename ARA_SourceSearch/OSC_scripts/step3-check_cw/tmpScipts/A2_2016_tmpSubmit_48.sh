#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0416/run007116/event007116.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007114.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0416/run007117/event007117.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007114.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0416/run007118/event007118.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007114.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0416/run007119/event007119.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007114.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0416/run007120/event007120.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007114.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0417/run007121/event007121.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007114.dat &
wait
