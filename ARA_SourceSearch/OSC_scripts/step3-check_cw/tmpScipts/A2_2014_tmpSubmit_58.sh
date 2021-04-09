#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0326/run003323/event003323.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003319.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0326/run003325/event003325.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003324.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0327/run003326/event003326.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003324.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0327/run003327/event003327.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003324.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0327/run003328/event003328.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003324.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0327/run003330/event003330.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003329.dat &
wait
