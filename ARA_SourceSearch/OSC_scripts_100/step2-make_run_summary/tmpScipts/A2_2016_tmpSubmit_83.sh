#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0608/run007412/event007412.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007365.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0608/run007413/event007413.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007365.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0608/run007414/event007414.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007365.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0609/run007416/event007416.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007415.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0609/run007417/event007417.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007415.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0609/run007418/event007418.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007415.dat &
wait
