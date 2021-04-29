#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0319/run003267/event003267.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003265.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0320/run003268/event003268.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003265.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0320/run003269/event003269.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003265.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0320/run003271/event003271.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003270.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0320/run003272/event003272.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003270.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0321/run003273/event003273.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003270.dat &
wait
