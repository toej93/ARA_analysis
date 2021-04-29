#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0721/run007640/event007640.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007621.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0721/run007641/event007641.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007621.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0721/run007642/event007642.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007621.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0721/run007643/event007643.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007621.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0721/run007644/event007644.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007621.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0721/run007645/event007645.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007621.dat &
wait
