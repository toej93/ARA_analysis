#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0529/run003669/event003669.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003666.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0529/run003670/event003670.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003666.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0530/run003672/event003672.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003671.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0530/run003673/event003673.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003671.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0530/run003674/event003674.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003671.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0530/run003675/event003675.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003671.dat &
wait
