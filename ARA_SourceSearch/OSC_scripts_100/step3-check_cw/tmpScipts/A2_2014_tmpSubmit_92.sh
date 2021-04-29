#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0515/run003595/event003595.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003561.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0515/run003596/event003596.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003561.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0515/run003597/event003597.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003561.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0515/run003598/event003598.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003561.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0515/run003599/event003599.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003561.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0515/run003600/event003600.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003561.dat &
wait
