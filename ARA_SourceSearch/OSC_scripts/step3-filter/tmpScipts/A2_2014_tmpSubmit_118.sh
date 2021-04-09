#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=02:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0620/run003788/event003788.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003787.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0621/run003789/event003789.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003787.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0621/run003790/event003790.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003787.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0621/run003791/event003791.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003787.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0621/run003793/event003793.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003792.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0621/run003795/event003795.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003792.dat &
wait
