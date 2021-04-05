#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=01:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1220/run006594/event006594.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006592.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1221/run006595/event006595.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006592.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1221/run006596/event006596.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006592.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1221/run006598/event006598.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006597.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1221/run006599/event006599.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006597.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1222/run006600/event006600.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006597.dat &
wait
