#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0815/run006035/event006035.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006033.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0816/run006036/event006036.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006033.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0816/run006037/event006037.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006033.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0816/run006039/event006039.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006038.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0817/run006044/event006044.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006038.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0817/run006045/event006045.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006038.dat &
wait
