#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0710/run003884/event003884.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003883.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0710/run003885/event003885.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003883.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0710/run003886/event003886.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003883.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0711/run003823/event003823.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003822.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0711/run003824/event003824.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003822.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0711/run003825/event003825.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003822.dat &
wait
