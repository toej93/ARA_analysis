#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=02:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0930/run006262/event006262.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006259.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0930/run006263/event006263.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006259.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1001/run006265/event006265.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006264.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1001/run006266/event006266.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006264.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1001/run006267/event006267.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006264.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1001/run006268/event006268.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006264.dat &
wait
