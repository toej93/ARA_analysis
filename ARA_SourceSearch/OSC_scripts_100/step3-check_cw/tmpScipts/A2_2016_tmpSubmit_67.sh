#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0514/run007258/event007258.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007255.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0514/run007259/event007259.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007255.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0515/run007261/event007261.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007260.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0515/run007262/event007262.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007260.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0515/run007263/event007263.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007260.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0515/run007264/event007264.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007260.dat &
wait
