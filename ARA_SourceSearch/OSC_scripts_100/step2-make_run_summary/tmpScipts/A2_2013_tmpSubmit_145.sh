#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2688/event2688.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002685/pedestalValues.run002685.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2689/event2689.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002685/pedestalValues.run002685.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2691/event2691.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002685/pedestalValues.run002685.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2692/event2692.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002685/pedestalValues.run002685.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2693/event2693.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002685/pedestalValues.run002685.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2694/event2694.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002685/pedestalValues.run002685.dat &
wait
