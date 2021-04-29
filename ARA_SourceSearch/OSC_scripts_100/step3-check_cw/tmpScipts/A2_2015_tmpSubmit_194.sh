#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0916/run006195/event006195.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006194.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0917/run006196/event006196.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006194.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0917/run006197/event006197.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006194.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0917/run006198/event006198.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006194.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0917/run006200/event006200.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006199.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0918/run006201/event006201.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006199.dat &
wait
