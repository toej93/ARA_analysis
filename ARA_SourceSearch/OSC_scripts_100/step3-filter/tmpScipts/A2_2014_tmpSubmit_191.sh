#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=02:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1028/run004321/event004321.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004315.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1028/run004322/event004322.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004315.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1028/run004323/event004323.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004315.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1028/run004439/event004439.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004435.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1028/run004441/event004441.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004440.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1028/run004442/event004442.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004440.dat &
wait
