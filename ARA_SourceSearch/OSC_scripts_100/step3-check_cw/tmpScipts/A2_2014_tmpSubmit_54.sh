#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0324/run003297/event003297.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003285.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0324/run003298/event003298.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003285.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0324/run003299/event003299.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003285.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0324/run003300/event003300.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003285.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0324/run003301/event003301.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003285.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0324/run003302/event003302.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003285.dat &
wait
