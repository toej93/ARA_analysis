#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=02:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run1642/event1642.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001615/pedestalValues.run001615.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run1645/event1645.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001643/pedestalValues.run001643.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run1646/event1646.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001643/pedestalValues.run001643.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run1647/event1647.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001643/pedestalValues.run001643.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run1652/event1652.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001643/pedestalValues.run001643.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run1653/event1653.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001643/pedestalValues.run001643.dat &
wait
