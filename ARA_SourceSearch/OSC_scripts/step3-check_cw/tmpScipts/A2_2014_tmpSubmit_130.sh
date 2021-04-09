#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0711/run003887/event003887.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003883.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0711/run003889/event003889.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003888.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0711/run003890/event003890.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003888.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0711/run003891/event003891.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003888.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0712/run003834/event003834.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003832.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0712/run003835/event003835.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003832.dat &
wait
