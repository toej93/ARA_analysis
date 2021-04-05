#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2393/event2393.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002385/pedestalValues.run002385.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2394/event2394.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002385/pedestalValues.run002385.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2396/event2396.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002395/pedestalValues.run002395.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2397/event2397.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002395/pedestalValues.run002395.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2398/event2398.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002395/pedestalValues.run002395.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2399/event2399.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002395/pedestalValues.run002395.dat &
wait
