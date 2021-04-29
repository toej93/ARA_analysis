#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=02:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0420/run007136/event007136.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007132.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0421/run007138/event007138.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007137.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0421/run007139/event007139.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007137.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0421/run007140/event007140.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007137.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0421/run007141/event007141.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007137.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0422/run007143/event007143.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007142.dat &
wait
