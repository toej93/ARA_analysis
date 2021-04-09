#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0414/run007109/event007109.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007105.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0414/run007110/event007110.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007105.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0415/run007111/event007111.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007105.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0415/run007112/event007112.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007105.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0415/run007113/event007113.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007105.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0415/run007115/event007115.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007114.dat &
wait
