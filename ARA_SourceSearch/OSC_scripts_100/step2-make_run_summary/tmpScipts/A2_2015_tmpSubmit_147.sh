#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0811/run006014/event006014.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006013.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0811/run006015/event006015.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006013.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0812/run006016/event006016.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006013.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0812/run006017/event006017.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006013.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0812/run006019/event006019.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006018.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0812/run006020/event006020.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006018.dat &
wait
