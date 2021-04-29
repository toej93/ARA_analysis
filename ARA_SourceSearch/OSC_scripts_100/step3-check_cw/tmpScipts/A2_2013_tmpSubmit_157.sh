#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2780/event2780.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002778/pedestalValues.run002778.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2781/event2781.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002778/pedestalValues.run002778.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2782/event2782.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002778/pedestalValues.run002778.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2784/event2784.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002778/pedestalValues.run002778.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2785/event2785.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002778/pedestalValues.run002778.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2786/event2786.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002778/pedestalValues.run002778.dat &
wait
