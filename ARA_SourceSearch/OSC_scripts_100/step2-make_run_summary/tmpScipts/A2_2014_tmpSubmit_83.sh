#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0603/run003697/event003697.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003691.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0603/run003699/event003699.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003698.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0604/run003700/event003700.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003698.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0604/run003701/event003701.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003698.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0604/run003702/event003702.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003698.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0604/run003703/event003703.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003698.dat &
wait
