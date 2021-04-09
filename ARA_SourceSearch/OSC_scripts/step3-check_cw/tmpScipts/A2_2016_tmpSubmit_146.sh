#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0909/run007905/event007905.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007903.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0910/run007906/event007906.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007903.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0910/run007907/event007907.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007903.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0910/run007909/event007909.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007908.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0910/run007910/event007910.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007908.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0911/run007911/event007911.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007908.dat &
wait
