#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=02:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0531/run007341/event007341.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007340.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0531/run007342/event007342.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007340.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0531/run007343/event007343.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007340.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0601/run007344/event007344.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007340.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0601/run007346/event007346.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007345.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0601/run007347/event007347.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007345.dat &
wait