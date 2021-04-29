#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=02:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0917/run007943/event007943.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007939.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0917/run007945/event007945.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007944.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0917/run007946/event007946.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007944.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0918/run007947/event007947.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007944.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0918/run007948/event007948.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007944.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0918/run007950/event007950.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007949.dat &
wait
