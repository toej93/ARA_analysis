#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0601/run007348/event007348.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007345.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0602/run007349/event007349.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007345.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0602/run007351/event007351.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007350.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0602/run007352/event007352.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007350.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0602/run007353/event007353.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007350.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0603/run007354/event007354.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007350.dat &
wait
