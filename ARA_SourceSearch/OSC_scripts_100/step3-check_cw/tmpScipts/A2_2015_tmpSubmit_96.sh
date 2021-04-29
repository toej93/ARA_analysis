#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0420/run005450/event005450.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005448.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0420/run005451/event005451.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005448.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0421/run005452/event005452.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005448.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0421/run005454/event005454.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005453.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0421/run005455/event005455.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005453.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0421/run005456/event005456.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005453.dat &
wait
