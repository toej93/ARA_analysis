#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0630/run003839/event003839.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003837.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0630/run003840/event003840.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003837.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0701/run003841/event003841.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003837.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0701/run003842/event003842.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003837.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0701/run003844/event003844.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003843.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0701/run003845/event003845.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003843.dat &
wait
