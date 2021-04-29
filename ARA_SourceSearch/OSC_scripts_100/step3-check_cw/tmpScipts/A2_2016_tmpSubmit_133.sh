#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0812/run007796/event007796.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007794.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0813/run007797/event007797.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007794.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0813/run007798/event007798.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007794.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0813/run007800/event007800.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007799.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0813/run007801/event007801.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007799.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0814/run007802/event007802.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007799.dat &
wait
