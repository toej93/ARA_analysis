#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0303/run003135/event003135.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003132.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0303/run003136/event003136.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003132.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0304/run003138/event003138.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003137.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0304/run003163/event003163.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003137.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0304/run003188/event003188.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003137.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0304/run003189/event003189.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003137.dat &
wait
