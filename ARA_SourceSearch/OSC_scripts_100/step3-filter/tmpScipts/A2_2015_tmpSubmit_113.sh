#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0621/run005759/event005759.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005758.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0621/run005760/event005760.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005758.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0621/run005761/event005761.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005758.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0621/run005762/event005762.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005758.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0622/run005764/event005764.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005763.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0622/run005765/event005765.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005763.dat &
wait
