#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2386/event2386.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002385/pedestalValues.run002385.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2387/event2387.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002385/pedestalValues.run002385.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2388/event2388.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002385/pedestalValues.run002385.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2389/event2389.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002385/pedestalValues.run002385.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2391/event2391.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002385/pedestalValues.run002385.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2392/event2392.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002385/pedestalValues.run002385.dat &
wait
