#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0217/run005070/event005070.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005066.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0217/run005072/event005072.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005071.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0217/run005073/event005073.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005071.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0218/run005074/event005074.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005071.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0218/run005075/event005075.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005071.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0218/run005077/event005077.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005076.dat &
wait
