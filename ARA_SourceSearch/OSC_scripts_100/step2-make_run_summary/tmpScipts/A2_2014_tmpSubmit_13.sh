#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0202/run002988/event002988.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run002981.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0202/run002989/event002989.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run002981.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0202/run002990/event002990.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run002981.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0203/run002992/event002992.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run002981.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0203/run002993/event002993.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run002981.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0203/run002995/event002995.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run002981.dat &
wait
