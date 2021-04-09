#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=02:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0504/run003520/event003520.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003516.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0504/run003522/event003522.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003521.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0504/run003523/event003523.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003521.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0505/run003524/event003524.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003521.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0505/run003525/event003525.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003521.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0505/run003527/event003527.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003526.dat &
wait
