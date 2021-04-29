#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0321/run003274/event003274.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003270.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0321/run003276/event003276.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003275.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0321/run003277/event003277.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003275.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0322/run003278/event003278.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003275.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0322/run003279/event003279.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003275.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0322/run003281/event003281.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003280.dat &
wait
