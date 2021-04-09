#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0324/run003303/event003303.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003285.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0324/run003304/event003304.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003285.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0324/run003305/event003305.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003285.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0324/run003306/event003306.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003285.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0324/run003307/event003307.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003285.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0324/run003308/event003308.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003285.dat &
wait
