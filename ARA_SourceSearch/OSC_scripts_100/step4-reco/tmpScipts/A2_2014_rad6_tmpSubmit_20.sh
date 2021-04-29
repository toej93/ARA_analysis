#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=09:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_reco ${ISSIM} ${STATION} ${YEAR} 6 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/ProcessedFile/A2/2014 ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0214/run002983/event002983.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run002981.dat &
./v2_analysis_reco ${ISSIM} ${STATION} ${YEAR} 6 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/ProcessedFile/A2/2014 ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0214/run002984/event002984.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run002981.dat &
./v2_analysis_reco ${ISSIM} ${STATION} ${YEAR} 6 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/ProcessedFile/A2/2014 ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0214/run002987/event002987.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run002981.dat &
./v2_analysis_reco ${ISSIM} ${STATION} ${YEAR} 6 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/ProcessedFile/A2/2014 ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0214/run002988/event002988.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run002981.dat &
./v2_analysis_reco ${ISSIM} ${STATION} ${YEAR} 6 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/ProcessedFile/A2/2014 ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0214/run002989/event002989.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run002981.dat &
./v2_analysis_reco ${ISSIM} ${STATION} ${YEAR} 6 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/ProcessedFile/A2/2014 ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0214/run003043/event003043.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003042.dat &
wait
