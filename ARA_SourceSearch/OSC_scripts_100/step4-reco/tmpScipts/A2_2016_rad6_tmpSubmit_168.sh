#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=09:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_reco ${ISSIM} ${STATION} ${YEAR} 6 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/ProcessedFile/A2/2016 ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/1013/run008079/event008079.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run008078.dat &
./v2_analysis_reco ${ISSIM} ${STATION} ${YEAR} 6 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/ProcessedFile/A2/2016 ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/1013/run008080/event008080.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run008078.dat &
./v2_analysis_reco ${ISSIM} ${STATION} ${YEAR} 6 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/ProcessedFile/A2/2016 ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/1013/run008081/event008081.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run008078.dat &
./v2_analysis_reco ${ISSIM} ${STATION} ${YEAR} 6 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/ProcessedFile/A2/2016 ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/1014/run008082/event008082.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run008078.dat &
./v2_analysis_reco ${ISSIM} ${STATION} ${YEAR} 6 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/ProcessedFile/A2/2016 ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/1014/run008084/event008084.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run008083.dat &
./v2_analysis_reco ${ISSIM} ${STATION} ${YEAR} 6 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/ProcessedFile/A2/2016 ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/1014/run008085/event008085.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run008083.dat &
wait
