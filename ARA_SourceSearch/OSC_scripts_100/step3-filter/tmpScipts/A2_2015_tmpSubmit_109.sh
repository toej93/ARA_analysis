#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=02:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0509/run005547/event005547.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005543.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0510/run005549/event005549.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005548.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0510/run005550/event005550.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005548.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0510/run005551/event005551.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005548.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0511/run005552/event005552.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005548.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0511/run005554/event005554.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005553.dat &
wait
