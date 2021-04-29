#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0812/run006020/event006020.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006018.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0813/run006021/event006021.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006018.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0813/run006022/event006022.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006018.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0813/run006024/event006024.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006023.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0813/run006025/event006025.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006023.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0814/run006026/event006026.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006023.dat &
wait
