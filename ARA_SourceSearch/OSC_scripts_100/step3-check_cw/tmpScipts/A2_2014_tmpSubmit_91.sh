#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0515/run003589/event003589.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003561.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0515/run003590/event003590.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003561.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0515/run003591/event003591.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003561.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0515/run003592/event003592.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003561.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0515/run003593/event003593.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003561.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0515/run003594/event003594.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003561.dat &
wait
