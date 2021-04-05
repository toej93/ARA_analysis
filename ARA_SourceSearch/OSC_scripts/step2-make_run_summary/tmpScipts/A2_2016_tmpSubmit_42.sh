#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=01:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0305/run006975/event006975.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006971.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0306/run006977/event006977.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006976.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0306/run006978/event006978.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006976.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0306/run006979/event006979.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006976.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0306/run006980/event006980.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006976.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0307/run006982/event006982.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006981.dat &
wait
