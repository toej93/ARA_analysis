#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1027/run004439/event004439.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004435.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1027/run004441/event004441.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004440.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1028/run004442/event004442.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004440.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1028/run004443/event004443.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004440.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1028/run004444/event004444.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004440.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1028/run004446/event004446.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004445.dat &
wait
