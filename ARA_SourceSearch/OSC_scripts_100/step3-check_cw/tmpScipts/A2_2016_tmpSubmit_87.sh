#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0614/run007440/event007440.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007437.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0614/run007441/event007441.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007437.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0614/run007443/event007443.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007442.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0615/run007444/event007444.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007442.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0615/run007445/event007445.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007442.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0615/run007446/event007446.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007442.dat &
wait
