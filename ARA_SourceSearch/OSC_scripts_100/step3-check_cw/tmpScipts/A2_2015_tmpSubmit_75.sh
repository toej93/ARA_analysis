#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0320/run005292/event005292.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005288.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0320/run005294/event005294.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005293.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0320/run005295/event005295.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005293.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0321/run005296/event005296.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005293.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0321/run005297/event005297.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005293.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0321/run005299/event005299.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005298.dat &
wait
