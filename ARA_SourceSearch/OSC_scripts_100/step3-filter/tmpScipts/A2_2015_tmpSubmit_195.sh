#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=02:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0918/run006202/event006202.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006199.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0918/run006203/event006203.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006199.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0918/run006205/event006205.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006204.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0919/run006206/event006206.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006204.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0919/run006207/event006207.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006204.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0919/run006208/event006208.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006204.dat &
wait
