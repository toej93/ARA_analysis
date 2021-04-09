#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=02:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0711/run007573/event007573.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007569.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0712/run007574/event007574.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007569.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0712/run007575/event007575.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007569.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0712/run007577/event007577.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007576.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0712/run007578/event007578.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007576.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0713/run007579/event007579.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007576.dat &
wait
