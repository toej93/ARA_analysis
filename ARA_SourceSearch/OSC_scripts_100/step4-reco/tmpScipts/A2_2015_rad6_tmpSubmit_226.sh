#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=09:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_reco ${ISSIM} ${STATION} ${YEAR} 6 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/ProcessedFile/A2/2015 ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1103/run006435/event006435.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006434.dat &
./v2_analysis_reco ${ISSIM} ${STATION} ${YEAR} 6 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/ProcessedFile/A2/2015 ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1103/run006436/event006436.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006434.dat &
./v2_analysis_reco ${ISSIM} ${STATION} ${YEAR} 6 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/ProcessedFile/A2/2015 ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1104/run006437/event006437.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006434.dat &
./v2_analysis_reco ${ISSIM} ${STATION} ${YEAR} 6 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/ProcessedFile/A2/2015 ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1104/run006438/event006438.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006434.dat &
./v2_analysis_reco ${ISSIM} ${STATION} ${YEAR} 6 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/ProcessedFile/A2/2015 ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1104/run006440/event006440.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006439.dat &
./v2_analysis_reco ${ISSIM} ${STATION} ${YEAR} 6 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/ProcessedFile/A2/2015 ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1104/run006441/event006441.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006439.dat &
wait
