#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0701/run007524/event007524.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007521.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0701/run007525/event007525.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007521.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0702/run007526/event007526.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007521.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0702/run007527/event007527.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007521.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0702/run007528/event007528.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007521.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0702/run007529/event007529.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007521.dat &
wait
