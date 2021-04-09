#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0928/run007996/event007996.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007994.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0928/run007997/event007997.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007994.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0928/run007998/event007998.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007994.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0928/run008000/event008000.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007999.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0929/run008001/event008001.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007999.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0929/run008002/event008002.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007999.dat &
wait
