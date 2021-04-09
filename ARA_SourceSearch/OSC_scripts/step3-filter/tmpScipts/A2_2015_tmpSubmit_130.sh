#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=02:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0610/run005705/event005705.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005703.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0610/run005706/event005706.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005703.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0611/run005707/event005707.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005703.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0611/run005709/event005709.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005708.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0611/run005710/event005710.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005708.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0611/run005711/event005711.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005708.dat &
wait
