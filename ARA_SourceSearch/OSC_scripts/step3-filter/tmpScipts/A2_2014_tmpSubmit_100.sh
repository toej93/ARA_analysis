#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=02:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0526/run003654/event003654.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003651.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0526/run003655/event003655.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003651.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0527/run003657/event003657.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003656.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0527/run003658/event003658.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003656.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0527/run003659/event003659.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003656.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0527/run003660/event003660.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003656.dat &
wait
