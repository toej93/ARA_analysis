#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=01:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0122/run006754/event006754.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006751.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0123/run006755/event006755.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006751.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0123/run006757/event006757.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006756.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0123/run006758/event006758.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006756.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0123/run006759/event006759.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006756.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0124/run006760/event006760.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006756.dat &
wait
