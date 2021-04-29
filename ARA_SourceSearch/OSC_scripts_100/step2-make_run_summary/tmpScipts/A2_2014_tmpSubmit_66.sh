#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0508/run003545/event003545.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003541.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0509/run003547/event003547.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003546.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0509/run003548/event003548.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003546.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0509/run003549/event003549.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003546.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0509/run003550/event003550.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003546.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0510/run003552/event003552.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003551.dat &
wait
