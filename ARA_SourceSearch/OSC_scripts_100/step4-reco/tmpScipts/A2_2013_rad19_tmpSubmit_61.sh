#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=09:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_reco ${ISSIM} ${STATION} ${YEAR} 19 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/ProcessedFile/A2/2013 ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run1947/event1947.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001931/pedestalValues.run001931.dat &
./v2_analysis_reco ${ISSIM} ${STATION} ${YEAR} 19 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/ProcessedFile/A2/2013 ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run1948/event1948.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001931/pedestalValues.run001931.dat &
./v2_analysis_reco ${ISSIM} ${STATION} ${YEAR} 19 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/ProcessedFile/A2/2013 ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run1949/event1949.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001931/pedestalValues.run001931.dat &
./v2_analysis_reco ${ISSIM} ${STATION} ${YEAR} 19 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/ProcessedFile/A2/2013 ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run1950/event1950.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001931/pedestalValues.run001931.dat &
./v2_analysis_reco ${ISSIM} ${STATION} ${YEAR} 19 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/ProcessedFile/A2/2013 ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run1952/event1952.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001951/pedestalValues.run001951.dat &
./v2_analysis_reco ${ISSIM} ${STATION} ${YEAR} 19 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/ProcessedFile/A2/2013 ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run1953/event1953.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001951/pedestalValues.run001951.dat &
wait
