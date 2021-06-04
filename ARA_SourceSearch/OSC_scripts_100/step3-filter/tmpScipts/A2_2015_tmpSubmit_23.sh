#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0206/run005017/event005017.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005016.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0206/run005018/event005018.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005016.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0207/run005019/event005019.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005016.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0207/run005020/event005020.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005016.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0207/run005022/event005022.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005021.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0207/run005023/event005023.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005021.dat &
wait
