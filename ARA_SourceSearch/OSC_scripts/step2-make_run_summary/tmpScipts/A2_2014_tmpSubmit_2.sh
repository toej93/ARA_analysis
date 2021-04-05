#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=01:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0204/run002990/event002990.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run002981.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0204/run002993/event002993.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run002981.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0205/run003002/event003002.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003001.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0205/run003003/event003003.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003001.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0206/run003004/event003004.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003001.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0207/run003009/event003009.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003001.dat &
wait
