#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2658/event2658.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002650/pedestalValues.run002650.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2659/event2659.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002650/pedestalValues.run002650.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2661/event2661.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002650/pedestalValues.run002650.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2662/event2662.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002650/pedestalValues.run002650.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2663/event2663.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002650/pedestalValues.run002650.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2664/event2664.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002650/pedestalValues.run002650.dat &
wait
