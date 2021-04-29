#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0402/run003357/event003357.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003356.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0402/run003358/event003358.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003356.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0402/run003359/event003359.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003356.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0402/run003360/event003360.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003356.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0403/run003362/event003362.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003361.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0403/run003363/event003363.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003361.dat &
wait
