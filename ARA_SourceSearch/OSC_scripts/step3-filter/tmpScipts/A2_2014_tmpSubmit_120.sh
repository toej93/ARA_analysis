#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=02:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0623/run003803/event003803.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003802.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0624/run003804/event003804.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003802.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0624/run003805/event003805.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003802.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0624/run003806/event003806.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003802.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0624/run003808/event003808.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003807.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0625/run003809/event003809.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003807.dat &
wait
