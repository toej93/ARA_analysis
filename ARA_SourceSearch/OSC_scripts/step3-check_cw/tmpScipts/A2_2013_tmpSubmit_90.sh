#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2189/event2189.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002186/pedestalValues.run002186.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2190/event2190.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002186/pedestalValues.run002186.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2192/event2192.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002186/pedestalValues.run002186.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2193/event2193.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002186/pedestalValues.run002186.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2194/event2194.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002186/pedestalValues.run002186.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2195/event2195.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002186/pedestalValues.run002186.dat &
wait
