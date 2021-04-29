#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=02:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0607/run003720/event003720.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003719.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0607/run003721/event003721.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003719.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0607/run003722/event003722.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003719.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0607/run003723/event003723.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003719.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0608/run003725/event003725.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003724.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0608/run003726/event003726.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003724.dat &
wait
