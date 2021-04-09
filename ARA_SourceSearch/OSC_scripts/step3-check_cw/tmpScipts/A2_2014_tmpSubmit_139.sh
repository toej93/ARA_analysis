#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0722/run003945/event003945.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003943.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0722/run003946/event003946.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003943.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0723/run003947/event003947.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003943.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0723/run003949/event003949.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003948.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0723/run003950/event003950.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003948.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0723/run003951/event003951.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003948.dat &
wait
