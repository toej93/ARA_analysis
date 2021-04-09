#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0525/run003647/event003647.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003646.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0525/run003648/event003648.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003646.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0525/run003649/event003649.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003646.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0525/run003650/event003650.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003646.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0526/run003652/event003652.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003651.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0526/run003653/event003653.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003651.dat &
wait
