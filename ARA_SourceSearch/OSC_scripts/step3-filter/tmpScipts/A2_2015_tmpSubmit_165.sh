#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=02:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0802/run005967/event005967.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005963.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0802/run005969/event005969.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005968.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0802/run005970/event005970.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005968.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0802/run005971/event005971.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005968.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0803/run005972/event005972.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005968.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0803/run005974/event005974.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005973.dat &
wait
