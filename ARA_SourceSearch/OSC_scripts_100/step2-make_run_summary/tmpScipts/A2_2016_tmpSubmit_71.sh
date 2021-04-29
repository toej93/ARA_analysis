#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0520/run007293/event007293.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007282.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0521/run007294/event007294.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007282.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0521/run007295/event007295.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007282.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0521/run007296/event007296.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007282.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0521/run007298/event007298.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007297.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0522/run007299/event007299.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007297.dat &
wait
