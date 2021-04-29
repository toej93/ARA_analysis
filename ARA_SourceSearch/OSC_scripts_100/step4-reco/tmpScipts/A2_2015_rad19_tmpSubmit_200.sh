#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=09:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_reco ${ISSIM} ${STATION} ${YEAR} 19 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/ProcessedFile/A2/2015 ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0925/run006240/event006240.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006239.dat &
./v2_analysis_reco ${ISSIM} ${STATION} ${YEAR} 19 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/ProcessedFile/A2/2015 ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0926/run006241/event006241.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006239.dat &
./v2_analysis_reco ${ISSIM} ${STATION} ${YEAR} 19 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/ProcessedFile/A2/2015 ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0926/run006242/event006242.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006239.dat &
./v2_analysis_reco ${ISSIM} ${STATION} ${YEAR} 19 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/ProcessedFile/A2/2015 ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0926/run006243/event006243.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006239.dat &
./v2_analysis_reco ${ISSIM} ${STATION} ${YEAR} 19 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/ProcessedFile/A2/2015 ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0926/run006245/event006245.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006244.dat &
./v2_analysis_reco ${ISSIM} ${STATION} ${YEAR} 19 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/ProcessedFile/A2/2015 ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0927/run006246/event006246.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006244.dat &
wait
