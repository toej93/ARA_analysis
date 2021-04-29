#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=02:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0417/run003432/event003432.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003431.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0417/run003433/event003433.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003431.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0417/run003434/event003434.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003431.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0417/run003435/event003435.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003431.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0418/run003437/event003437.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003436.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0418/run003438/event003438.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003436.dat &
wait
