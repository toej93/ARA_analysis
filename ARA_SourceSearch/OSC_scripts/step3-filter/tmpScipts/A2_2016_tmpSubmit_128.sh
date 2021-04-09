#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=02:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0804/run007753/event007753.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007750.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0805/run007754/event007754.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007750.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0805/run007756/event007756.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007755.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0805/run007757/event007757.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007755.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0805/run007758/event007758.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007755.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0806/run007760/event007760.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007755.dat &
wait
