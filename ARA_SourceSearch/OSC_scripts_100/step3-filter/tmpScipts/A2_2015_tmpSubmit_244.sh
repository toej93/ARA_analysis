#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=02:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1219/run006587/event006587.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006580.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1219/run006588/event006588.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006580.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1219/run006589/event006589.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006580.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1220/run006590/event006590.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006580.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1220/run006591/event006591.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006580.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1220/run006593/event006593.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006592.dat &
wait
