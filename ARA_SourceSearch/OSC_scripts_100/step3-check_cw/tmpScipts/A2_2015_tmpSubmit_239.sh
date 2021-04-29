#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1211/run006547/event006547.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006543.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1211/run006549/event006549.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006548.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1212/run006550/event006550.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006548.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1212/run006551/event006551.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006548.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1212/run006552/event006552.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006548.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1212/run006554/event006554.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006553.dat &
wait
