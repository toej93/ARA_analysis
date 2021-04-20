#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=01:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1018/run006352/event006352.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006349.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1018/run006353/event006353.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006349.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1018/run006355/event006355.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006354.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1019/run006356/event006356.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006354.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1019/run006357/event006357.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006354.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1019/run006358/event006358.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006354.dat &
wait