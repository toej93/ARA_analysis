#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2438/event2438.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002430/pedestalValues.run002430.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2439/event2439.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002430/pedestalValues.run002430.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2441/event2441.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002430/pedestalValues.run002430.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2442/event2442.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002430/pedestalValues.run002430.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2443/event2443.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002430/pedestalValues.run002430.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2444/event2444.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002430/pedestalValues.run002430.dat &
wait
