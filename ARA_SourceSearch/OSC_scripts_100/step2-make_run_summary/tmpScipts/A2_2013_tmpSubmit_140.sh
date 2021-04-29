#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2651/event2651.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002650/pedestalValues.run002650.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2652/event2652.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002650/pedestalValues.run002650.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2653/event2653.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002650/pedestalValues.run002650.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2654/event2654.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002650/pedestalValues.run002650.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2656/event2656.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002650/pedestalValues.run002650.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2657/event2657.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002650/pedestalValues.run002650.dat &
wait
