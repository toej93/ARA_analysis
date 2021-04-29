#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/1105/run008193/event008193.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run008190.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/1105/run008194/event008194.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run008190.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/1106/run008196/event008196.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run008195.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/1106/run008197/event008197.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run008195.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/1106/run008198/event008198.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run008195.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/1106/run008199/event008199.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run008195.dat &
wait
