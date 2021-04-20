#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0218/run006893/event006893.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006891.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0218/run006894/event006894.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006891.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0218/run006895/event006895.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006891.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0219/run006897/event006897.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006896.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0219/run006898/event006898.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006896.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0219/run006899/event006899.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006896.dat &
wait