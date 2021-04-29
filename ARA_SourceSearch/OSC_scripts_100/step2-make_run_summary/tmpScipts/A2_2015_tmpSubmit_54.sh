#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0325/run005316/event005316.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005313.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0325/run005317/event005317.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005313.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0325/run005319/event005319.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005318.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0325/run005320/event005320.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005318.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0326/run005321/event005321.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005318.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0326/run005322/event005322.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005318.dat &
wait
