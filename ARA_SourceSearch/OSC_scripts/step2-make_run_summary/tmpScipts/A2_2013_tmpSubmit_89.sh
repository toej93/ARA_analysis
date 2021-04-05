#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=01:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2182/event2182.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002176/pedestalValues.run002176.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2183/event2183.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002176/pedestalValues.run002176.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2184/event2184.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002176/pedestalValues.run002176.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2185/event2185.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002176/pedestalValues.run002176.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2187/event2187.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002186/pedestalValues.run002186.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2188/event2188.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002186/pedestalValues.run002186.dat &
wait
