#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=09:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_reco ${ISSIM} ${STATION} ${YEAR} 19 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/ProcessedFile/A2/2014 ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1006/run004308/event004308.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004305.dat &
./v2_analysis_reco ${ISSIM} ${STATION} ${YEAR} 19 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/ProcessedFile/A2/2014 ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1007/run004311/event004311.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004310.dat &
./v2_analysis_reco ${ISSIM} ${STATION} ${YEAR} 19 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/ProcessedFile/A2/2014 ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1007/run004336/event004336.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004335.dat &
./v2_analysis_reco ${ISSIM} ${STATION} ${YEAR} 19 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/ProcessedFile/A2/2014 ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1007/run004337/event004337.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004335.dat &
./v2_analysis_reco ${ISSIM} ${STATION} ${YEAR} 19 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/ProcessedFile/A2/2014 ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1007/run004338/event004338.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004335.dat &
./v2_analysis_reco ${ISSIM} ${STATION} ${YEAR} 19 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/ProcessedFile/A2/2014 ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1007/run004339/event004339.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004335.dat &
wait
