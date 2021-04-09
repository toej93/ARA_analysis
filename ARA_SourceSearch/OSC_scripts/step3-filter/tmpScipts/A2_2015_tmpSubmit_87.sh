#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=02:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0407/run005382/event005382.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005378.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0407/run005384/event005384.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005383.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0407/run005385/event005385.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005383.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0407/run005386/event005386.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005383.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0408/run005387/event005387.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005383.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0408/run005389/event005389.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005388.dat &
wait
