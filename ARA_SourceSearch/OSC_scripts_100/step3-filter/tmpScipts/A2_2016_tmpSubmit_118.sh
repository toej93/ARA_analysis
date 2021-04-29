#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=02:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0721/run007664/event007664.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007621.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0721/run007665/event007665.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007621.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0721/run007666/event007666.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007621.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0721/run007667/event007667.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007621.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0721/run007668/event007668.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007621.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0721/run007684/event007684.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007621.dat &
wait
