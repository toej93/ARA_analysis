#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=02:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0424/run003469/event003469.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003461.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0424/run003471/event003471.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003470.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0425/run003472/event003472.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003470.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0425/run003473/event003473.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003470.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0425/run003475/event003475.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003470.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0425/run003476/event003476.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003470.dat &
wait
