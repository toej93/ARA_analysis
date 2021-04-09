#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0210/run002901/event002901.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run002894.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0210/run002903/event002903.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run002894.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0210/run002905/event002905.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run002894.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0210/run002906/event002906.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run002894.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0210/run002907/event002907.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run002894.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0210/run003024/event003024.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003021.dat &
wait
