#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=02:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0529/run007333/event007333.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007326.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0530/run007334/event007334.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007326.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0530/run007336/event007336.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007335.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0530/run007337/event007337.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007335.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0530/run007338/event007338.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007335.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0531/run007339/event007339.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007335.dat &
wait
