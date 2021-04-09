#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=02:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1009/run006307/event006307.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006304.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1009/run006308/event006308.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006304.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1010/run006310/event006310.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006309.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1010/run006311/event006311.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006309.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1010/run006312/event006312.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006309.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1010/run006313/event006313.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006309.dat &
wait
