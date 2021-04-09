#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0212/run002871/event002871.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run002862.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0212/run002873/event002873.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run002862.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0212/run002875/event002875.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run002862.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0212/run002876/event002876.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run002862.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0212/run002880/event002880.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run002877.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0212/run002943/event002943.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run002941.dat &
wait
