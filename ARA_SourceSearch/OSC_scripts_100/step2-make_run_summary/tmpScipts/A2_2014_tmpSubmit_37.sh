#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0318/run003259/event003259.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003255.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0318/run003261/event003261.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003260.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0318/run003262/event003262.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003260.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0319/run003263/event003263.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003260.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0319/run003264/event003264.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003260.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0319/run003266/event003266.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003265.dat &
wait
