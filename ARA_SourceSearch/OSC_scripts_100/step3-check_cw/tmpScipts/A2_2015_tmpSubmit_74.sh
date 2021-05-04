#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0318/run005285/event005285.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005283.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0319/run005286/event005286.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005283.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0319/run005287/event005287.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005283.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0319/run005289/event005289.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005288.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0319/run005290/event005290.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005288.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0320/run005291/event005291.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005288.dat &
wait