#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0412/run003409/event003409.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003406.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0412/run003410/event003410.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003406.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0413/run003412/event003412.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003411.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0413/run003413/event003413.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003411.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0413/run003414/event003414.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003411.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0413/run003415/event003415.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003411.dat &
wait
