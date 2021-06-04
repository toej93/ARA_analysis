#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0325/run003321/event003321.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003319.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0325/run003322/event003322.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003319.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0326/run003323/event003323.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003319.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0326/run003325/event003325.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003324.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0326/run003326/event003326.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003324.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0326/run003327/event003327.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003324.dat &
wait
