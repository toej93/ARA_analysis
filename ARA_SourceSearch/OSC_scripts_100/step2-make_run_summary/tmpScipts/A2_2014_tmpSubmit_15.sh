#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0207/run003013/event003013.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003001.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0207/run003015/event003015.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003001.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0208/run003017/event003017.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003001.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0208/run003019/event003019.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003001.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0208/run003020/event003020.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003001.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0209/run003023/event003023.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003021.dat &
wait
