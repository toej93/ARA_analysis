#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0401/run005352/event005352.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005348.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0401/run005354/event005354.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005353.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0401/run005355/event005355.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005353.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0402/run005356/event005356.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005353.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0402/run005357/event005357.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005353.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0402/run005359/event005359.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005358.dat &
wait
