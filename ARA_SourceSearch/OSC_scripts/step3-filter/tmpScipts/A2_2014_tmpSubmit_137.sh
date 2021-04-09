#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=02:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0719/run003930/event003930.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003928.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0719/run003931/event003931.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003928.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0720/run003932/event003932.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003928.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0720/run003934/event003934.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003933.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0720/run003935/event003935.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003933.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0720/run003936/event003936.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003933.dat &
wait
