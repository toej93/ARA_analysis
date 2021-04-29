#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0506/run007217/event007217.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007214.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0507/run007218/event007218.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007214.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0507/run007220/event007220.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007219.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0507/run007221/event007221.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007219.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0507/run007222/event007222.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007219.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0508/run007223/event007223.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007219.dat &
wait
