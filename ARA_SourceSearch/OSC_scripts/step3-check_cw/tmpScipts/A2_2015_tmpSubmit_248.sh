#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1225/run006617/event006617.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006616.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1225/run006618/event006618.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006616.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1226/run006619/event006619.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006616.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1226/run006620/event006620.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006616.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1226/run006622/event006622.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006621.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1226/run006623/event006623.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006621.dat &
wait
