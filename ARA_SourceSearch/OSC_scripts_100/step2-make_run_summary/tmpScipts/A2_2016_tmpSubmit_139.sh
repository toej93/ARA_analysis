#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0911/run007912/event007912.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007908.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0911/run007914/event007914.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007913.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0911/run007915/event007915.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007913.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0912/run007916/event007916.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007913.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0912/run007919/event007919.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007913.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0912/run007920/event007920.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007913.dat &
wait
