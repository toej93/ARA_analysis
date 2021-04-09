#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=02:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1124/run004575/event004575.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004571.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1125/run004577/event004577.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004576.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1125/run004578/event004578.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004576.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1125/run004579/event004579.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004576.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1125/run004580/event004580.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004576.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1126/run004582/event004582.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004581.dat &
wait
