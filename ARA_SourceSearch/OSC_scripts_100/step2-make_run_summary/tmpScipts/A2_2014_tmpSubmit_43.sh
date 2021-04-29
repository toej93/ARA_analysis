#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0327/run003328/event003328.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003324.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0327/run003330/event003330.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003329.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0327/run003331/event003331.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003329.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0327/run003332/event003332.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003329.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0328/run003333/event003333.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003329.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0328/run003335/event003335.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003334.dat &
wait
