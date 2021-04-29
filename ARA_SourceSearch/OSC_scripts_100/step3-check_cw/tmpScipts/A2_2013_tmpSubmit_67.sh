#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run1992/event1992.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001986/pedestalValues.run001986.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run1993/event1993.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001986/pedestalValues.run001986.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run1994/event1994.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001986/pedestalValues.run001986.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run1995/event1995.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001986/pedestalValues.run001986.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run1997/event1997.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001996/pedestalValues.run001996.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run1998/event1998.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001996/pedestalValues.run001996.dat &
wait
