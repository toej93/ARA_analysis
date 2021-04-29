#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=09:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_reco ${ISSIM} ${STATION} ${YEAR} 6 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/ProcessedFile/A2/2016 ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0519/run007280/event007280.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007277.dat &
./v2_analysis_reco ${ISSIM} ${STATION} ${YEAR} 6 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/ProcessedFile/A2/2016 ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0519/run007281/event007281.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007277.dat &
./v2_analysis_reco ${ISSIM} ${STATION} ${YEAR} 6 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/ProcessedFile/A2/2016 ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0519/run007283/event007283.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007282.dat &
./v2_analysis_reco ${ISSIM} ${STATION} ${YEAR} 6 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/ProcessedFile/A2/2016 ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0519/run007284/event007284.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007282.dat &
./v2_analysis_reco ${ISSIM} ${STATION} ${YEAR} 6 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/ProcessedFile/A2/2016 ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0520/run007285/event007285.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007282.dat &
./v2_analysis_reco ${ISSIM} ${STATION} ${YEAR} 6 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/ProcessedFile/A2/2016 ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0520/run007286/event007286.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007282.dat &
wait
