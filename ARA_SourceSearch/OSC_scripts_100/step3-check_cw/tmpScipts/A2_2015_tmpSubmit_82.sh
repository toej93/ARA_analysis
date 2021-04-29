#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0330/run005345/event005345.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005343.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0331/run005346/event005346.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005343.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0331/run005347/event005347.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005343.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0331/run005349/event005349.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005348.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0331/run005350/event005350.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005348.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0401/run005351/event005351.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005348.dat &
wait
