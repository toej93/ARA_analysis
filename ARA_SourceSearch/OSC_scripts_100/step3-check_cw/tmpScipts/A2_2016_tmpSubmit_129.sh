#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0806/run007761/event007761.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007755.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0806/run007762/event007762.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007755.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0807/run007763/event007763.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007755.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0807/run007764/event007764.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007755.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0807/run007766/event007766.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007765.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0807/run007767/event007767.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007765.dat &
wait
