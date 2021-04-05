#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=01:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1222/run006601/event006601.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006597.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1222/run006603/event006603.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006602.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1222/run006604/event006604.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006602.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1223/run006606/event006606.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006602.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1223/run006607/event006607.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006602.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1223/run006608/event006608.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006602.dat &
wait
