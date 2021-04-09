#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=09:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_reco ${ISSIM} ${STATION} ${YEAR} 19 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/ProcessedFile/A2/2014 ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0605/run003712/event003712.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003709.dat &
./v2_analysis_reco ${ISSIM} ${STATION} ${YEAR} 19 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/ProcessedFile/A2/2014 ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0605/run003713/event003713.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003709.dat &
./v2_analysis_reco ${ISSIM} ${STATION} ${YEAR} 19 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/ProcessedFile/A2/2014 ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0606/run003715/event003715.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003714.dat &
./v2_analysis_reco ${ISSIM} ${STATION} ${YEAR} 19 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/ProcessedFile/A2/2014 ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0606/run003716/event003716.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003714.dat &
./v2_analysis_reco ${ISSIM} ${STATION} ${YEAR} 19 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/ProcessedFile/A2/2014 ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0606/run003717/event003717.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003714.dat &
./v2_analysis_reco ${ISSIM} ${STATION} ${YEAR} 19 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/ProcessedFile/A2/2014 ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0606/run003718/event003718.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003714.dat &
wait
