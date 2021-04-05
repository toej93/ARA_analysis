#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2022/event2022.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002021/pedestalValues.run002021.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2023/event2023.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002021/pedestalValues.run002021.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2024/event2024.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002021/pedestalValues.run002021.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2025/event2025.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002021/pedestalValues.run002021.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2027/event2027.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002021/pedestalValues.run002021.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2028/event2028.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002021/pedestalValues.run002021.dat &
wait
