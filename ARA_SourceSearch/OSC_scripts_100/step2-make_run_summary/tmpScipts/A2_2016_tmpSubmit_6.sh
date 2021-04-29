#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0110/run006694/event006694.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006692.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0110/run006696/event006696.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006692.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0111/run006699/event006699.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006692.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0111/run006700/event006700.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006692.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0111/run006702/event006702.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006692.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0112/run006703/event006703.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006692.dat &
wait
