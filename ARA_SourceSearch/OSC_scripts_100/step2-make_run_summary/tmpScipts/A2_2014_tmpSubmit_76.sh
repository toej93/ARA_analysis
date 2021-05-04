#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0524/run003645/event003645.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003641.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0524/run003647/event003647.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003646.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0525/run003648/event003648.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003646.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0525/run003649/event003649.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003646.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0525/run003650/event003650.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003646.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0525/run003652/event003652.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003651.dat &
wait