#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0414/run003417/event003417.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003416.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0414/run003418/event003418.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003416.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0414/run003419/event003419.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003416.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0414/run003420/event003420.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003416.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0415/run003422/event003422.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003421.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0415/run003423/event003423.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003421.dat &
wait
