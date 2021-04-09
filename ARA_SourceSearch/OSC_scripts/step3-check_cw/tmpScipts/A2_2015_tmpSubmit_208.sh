#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1008/run006300/event006300.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006299.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1008/run006301/event006301.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006299.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1008/run006302/event006302.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006299.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1008/run006303/event006303.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006299.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1009/run006305/event006305.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006304.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1009/run006306/event006306.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006304.dat &
wait
