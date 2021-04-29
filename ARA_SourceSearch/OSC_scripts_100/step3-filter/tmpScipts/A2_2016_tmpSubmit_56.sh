#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=02:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0428/run007174/event007174.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007168.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0428/run007175/event007175.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007168.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0428/run007176/event007176.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007168.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0428/run007177/event007177.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007168.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0428/run007178/event007178.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007168.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0429/run007179/event007179.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007168.dat &
wait
