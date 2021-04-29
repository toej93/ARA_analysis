#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1103/run006436/event006436.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006434.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1104/run006437/event006437.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006434.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1104/run006438/event006438.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006434.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1104/run006440/event006440.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006439.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1104/run006441/event006441.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006439.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1105/run006442/event006442.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006439.dat &
wait
