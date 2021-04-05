#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2075/event2075.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002046/pedestalValues.run002046.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2076/event2076.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002046/pedestalValues.run002046.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2077/event2077.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002046/pedestalValues.run002046.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2079/event2079.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002046/pedestalValues.run002046.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2080/event2080.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002046/pedestalValues.run002046.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2081/event2081.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002046/pedestalValues.run002046.dat &
wait
