#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0721/run007634/event007634.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007621.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0721/run007635/event007635.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007621.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0721/run007636/event007636.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007621.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0721/run007637/event007637.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007621.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0721/run007638/event007638.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007621.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0721/run007639/event007639.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007621.dat &
wait
