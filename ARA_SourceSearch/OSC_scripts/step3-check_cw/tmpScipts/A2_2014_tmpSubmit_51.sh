#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0322/run003277/event003277.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003275.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0322/run003278/event003278.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003275.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0322/run003279/event003279.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003275.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0322/run003281/event003281.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003280.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0323/run003282/event003282.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003280.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0323/run003283/event003283.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003280.dat &
wait
