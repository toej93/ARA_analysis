#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=02:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0127/run006776/event006776.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006771.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0127/run006778/event006778.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006777.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0127/run006779/event006779.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006777.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0128/run006780/event006780.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006777.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0128/run006781/event006781.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006777.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0128/run006783/event006783.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006782.dat &
wait
