#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0428/run007175/event007175.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007168.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0428/run007176/event007176.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007168.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0428/run007177/event007177.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007168.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0428/run007178/event007178.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007168.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0429/run007179/event007179.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007168.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0429/run007181/event007181.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007180.dat &
wait
