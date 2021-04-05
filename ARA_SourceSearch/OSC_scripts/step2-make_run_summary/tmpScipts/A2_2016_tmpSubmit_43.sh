#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=01:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0307/run006983/event006983.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006981.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0307/run006984/event006984.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006981.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0307/run006985/event006985.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006981.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0308/run006987/event006987.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006986.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0308/run006988/event006988.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006986.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0308/run006989/event006989.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006986.dat &
wait
