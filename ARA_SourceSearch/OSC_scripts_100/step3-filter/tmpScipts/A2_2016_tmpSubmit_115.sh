#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=02:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0721/run007646/event007646.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007621.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0721/run007647/event007647.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007621.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0721/run007648/event007648.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007621.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0721/run007649/event007649.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007621.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0721/run007650/event007650.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007621.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0721/run007651/event007651.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007621.dat &
wait
