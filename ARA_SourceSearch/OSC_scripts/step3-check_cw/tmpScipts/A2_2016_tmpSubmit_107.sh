#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0714/run007588/event007588.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007586.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0715/run007589/event007589.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007586.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0715/run007590/event007590.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007586.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0715/run007592/event007592.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007591.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0715/run007593/event007593.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007591.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0716/run007594/event007594.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007591.dat &
wait
