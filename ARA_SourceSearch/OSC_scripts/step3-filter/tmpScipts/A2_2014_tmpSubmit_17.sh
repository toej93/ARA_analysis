#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=02:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0212/run002954/event002954.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run002951.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0212/run002955/event002955.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run002951.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0212/run003035/event003035.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003031.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0212/run003037/event003037.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003031.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0213/run002957/event002957.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run002951.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0213/run002960/event002960.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run002951.dat &
wait
