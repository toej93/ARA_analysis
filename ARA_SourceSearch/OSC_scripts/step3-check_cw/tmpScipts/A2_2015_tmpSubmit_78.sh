#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0324/run005315/event005315.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005313.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0325/run005316/event005316.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005313.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0325/run005317/event005317.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005313.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0325/run005319/event005319.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005318.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0325/run005320/event005320.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005318.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0326/run005321/event005321.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005318.dat &
wait
