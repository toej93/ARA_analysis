#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0131/run004987/event004987.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004986.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0131/run004988/event004988.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004986.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0131/run004989/event004989.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004986.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0201/run004990/event004990.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004986.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0201/run004992/event004992.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004991.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0201/run004993/event004993.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004991.dat &
wait
