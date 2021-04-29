#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0824/run006077/event006077.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006074.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0824/run006078/event006078.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006074.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0824/run006080/event006080.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006079.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0825/run006081/event006081.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006079.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0825/run006082/event006082.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006079.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0825/run006083/event006083.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006079.dat &
wait
