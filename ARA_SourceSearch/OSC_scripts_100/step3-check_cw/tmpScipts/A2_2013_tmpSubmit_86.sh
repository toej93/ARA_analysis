#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2159/event2159.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002157/pedestalValues.run002157.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2161/event2161.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002157/pedestalValues.run002157.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2162/event2162.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002157/pedestalValues.run002157.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2163/event2163.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002157/pedestalValues.run002157.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2164/event2164.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002157/pedestalValues.run002157.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2165/event2165.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002157/pedestalValues.run002157.dat &
wait
