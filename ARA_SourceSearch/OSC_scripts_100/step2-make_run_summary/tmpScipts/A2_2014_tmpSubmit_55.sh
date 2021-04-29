#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0414/run003422/event003422.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003421.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0414/run003423/event003423.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003421.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0415/run003424/event003424.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003421.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0415/run003425/event003425.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003421.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0415/run003427/event003427.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003426.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0415/run003428/event003428.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003426.dat &
wait
