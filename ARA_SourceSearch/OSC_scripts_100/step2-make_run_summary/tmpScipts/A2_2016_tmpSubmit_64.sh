#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0510/run007233/event007233.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007229.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0510/run007235/event007235.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007234.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0510/run007240/event007240.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007234.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0511/run007241/event007241.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007234.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0511/run007242/event007242.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007234.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0511/run007243/event007243.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007234.dat &
wait
