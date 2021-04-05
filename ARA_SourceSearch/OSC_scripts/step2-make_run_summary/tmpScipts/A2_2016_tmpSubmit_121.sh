#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=01:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0725/run007700/event007700.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007699.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0725/run007701/event007701.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007699.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0725/run007702/event007702.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007699.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0725/run007703/event007703.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007699.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0726/run007704/event007704.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007699.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0726/run007705/event007705.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007699.dat &
wait
