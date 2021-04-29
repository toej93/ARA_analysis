#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=02:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0517/run007273/event007273.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007272.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0517/run007274/event007274.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007272.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0518/run007275/event007275.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007272.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0518/run007276/event007276.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007272.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0518/run007278/event007278.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007277.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0518/run007279/event007279.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007277.dat &
wait
