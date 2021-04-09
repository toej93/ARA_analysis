#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=02:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1210/run006540/event006540.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006538.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1210/run006541/event006541.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006538.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1210/run006542/event006542.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006538.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1210/run006544/event006544.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006543.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1211/run006545/event006545.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006543.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1211/run006546/event006546.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006543.dat &
wait
