#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0731/run007731/event007731.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007726.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0731/run007732/event007732.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007726.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0731/run007733/event007733.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007726.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0801/run007734/event007734.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007726.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0801/run007736/event007736.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007735.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0801/run007737/event007737.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007735.dat &
wait
