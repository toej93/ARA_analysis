#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=02:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0929/run006255/event006255.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006254.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0929/run006256/event006256.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006254.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0929/run006257/event006257.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006254.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0929/run006258/event006258.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006254.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0930/run006260/event006260.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006259.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0930/run006261/event006261.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006259.dat &
wait
