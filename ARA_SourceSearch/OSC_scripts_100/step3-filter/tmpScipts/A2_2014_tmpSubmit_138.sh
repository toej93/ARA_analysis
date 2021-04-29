#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=02:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0721/run003937/event003937.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003933.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0721/run003939/event003939.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003938.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0721/run003940/event003940.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003938.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0721/run003941/event003941.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003938.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0722/run003942/event003942.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003938.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0722/run003944/event003944.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003943.dat &
wait
