#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0418/run003439/event003439.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003436.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0418/run003440/event003440.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003436.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0419/run003442/event003442.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003441.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0419/run003443/event003443.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003441.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0419/run003444/event003444.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003441.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0419/run003445/event003445.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003441.dat &
wait
