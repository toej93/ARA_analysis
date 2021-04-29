#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=02:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0611/run003742/event003742.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003739.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0612/run003743/event003743.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003739.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0612/run003745/event003745.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003744.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0612/run003746/event003746.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003744.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0612/run003747/event003747.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003744.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0613/run003748/event003748.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003744.dat &
wait
