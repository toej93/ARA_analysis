#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0607/run005690/event005690.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005688.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0607/run005691/event005691.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005688.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0608/run005692/event005692.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005688.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0608/run005694/event005694.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005693.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0608/run005695/event005695.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005693.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0608/run005696/event005696.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005693.dat &
wait
