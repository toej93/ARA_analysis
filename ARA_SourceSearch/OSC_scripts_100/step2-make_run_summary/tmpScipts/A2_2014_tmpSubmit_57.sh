#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0417/run003437/event003437.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003436.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0417/run003438/event003438.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003436.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0418/run003439/event003439.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003436.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0418/run003440/event003440.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003436.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0418/run003442/event003442.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003441.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0418/run003443/event003443.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003441.dat &
wait
