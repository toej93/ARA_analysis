#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=02:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0214/run005055/event005055.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005051.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0214/run005057/event005057.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005056.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0214/run005058/event005058.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005056.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0215/run005059/event005059.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005056.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0215/run005060/event005060.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005056.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0215/run005062/event005062.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005061.dat &
wait
