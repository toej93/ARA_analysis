#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1012/run006322/event006322.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006319.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1012/run006323/event006323.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006319.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1013/run006325/event006325.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006324.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1013/run006326/event006326.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006324.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1013/run006327/event006327.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006324.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1013/run006328/event006328.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006324.dat &
wait
