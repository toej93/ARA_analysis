#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0715/run007589/event007589.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007586.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0715/run007590/event007590.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007586.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0715/run007592/event007592.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007591.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0715/run007593/event007593.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007591.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0716/run007594/event007594.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007591.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0716/run007595/event007595.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007591.dat &
wait
