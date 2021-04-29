#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1210/run006544/event006544.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006543.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1211/run006545/event006545.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006543.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1211/run006546/event006546.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006543.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1211/run006547/event006547.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006543.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1211/run006549/event006549.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006548.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1212/run006550/event006550.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006548.dat &
wait
