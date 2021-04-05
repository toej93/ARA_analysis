#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=01:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1102/run006427/event006427.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006424.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1102/run006428/event006428.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006424.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1102/run006430/event006430.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006429.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1103/run006431/event006431.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006429.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1103/run006432/event006432.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006429.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1103/run006433/event006433.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006429.dat &
wait
