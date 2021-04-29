#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0710/run007565/event007565.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007561.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0710/run007566/event007566.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007561.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0710/run007567/event007567.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007561.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0710/run007568/event007568.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007561.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0711/run007571/event007571.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007569.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0711/run007572/event007572.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007569.dat &
wait
