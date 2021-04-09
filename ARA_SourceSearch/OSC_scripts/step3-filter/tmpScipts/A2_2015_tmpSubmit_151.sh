#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=02:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0712/run005862/event005862.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005858.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0712/run005864/event005864.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005863.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0712/run005865/event005865.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005863.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0712/run005866/event005866.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005863.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0713/run005867/event005867.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005863.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0713/run005869/event005869.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005868.dat &
wait
