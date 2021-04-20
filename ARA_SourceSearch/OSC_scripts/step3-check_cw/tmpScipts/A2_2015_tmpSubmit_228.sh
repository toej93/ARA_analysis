#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1106/run006450/event006450.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006449.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1106/run006451/event006451.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006449.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1107/run006452/event006452.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006449.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1107/run006453/event006453.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006449.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1107/run006455/event006455.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006454.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1107/run006456/event006456.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006454.dat &
wait