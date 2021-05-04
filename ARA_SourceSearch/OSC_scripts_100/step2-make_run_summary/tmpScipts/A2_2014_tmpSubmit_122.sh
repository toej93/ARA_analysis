#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0731/run003990/event003990.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003988.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0731/run003993/event003993.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003988.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0731/run003995/event003995.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003988.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0731/run003996/event003996.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003988.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0731/run003997/event003997.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003988.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0731/run003998/event003998.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003988.dat &
wait