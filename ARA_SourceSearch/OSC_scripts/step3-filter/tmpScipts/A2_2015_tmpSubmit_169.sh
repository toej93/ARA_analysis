#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=02:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0808/run005997/event005997.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005993.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0808/run005999/event005999.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005998.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0808/run006000/event006000.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005998.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0809/run006001/event006001.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005998.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0809/run006002/event006002.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005998.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0809/run006004/event006004.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006003.dat &
wait
