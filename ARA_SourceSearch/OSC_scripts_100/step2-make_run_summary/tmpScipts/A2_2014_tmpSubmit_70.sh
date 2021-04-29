#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0515/run003600/event003600.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003561.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0515/run003602/event003602.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003601.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0515/run003603/event003603.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003601.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0516/run003604/event003604.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003601.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0516/run003605/event003605.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003601.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0516/run003607/event003607.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003606.dat &
wait
