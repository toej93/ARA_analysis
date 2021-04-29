#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0926/run007988/event007988.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007984.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0926/run007990/event007990.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007989.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0926/run007991/event007991.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007989.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0927/run007992/event007992.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007989.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0927/run007993/event007993.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007989.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0927/run007995/event007995.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007994.dat &
wait
