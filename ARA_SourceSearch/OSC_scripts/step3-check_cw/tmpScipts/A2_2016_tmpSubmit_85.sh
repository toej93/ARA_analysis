#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0611/run007426/event007426.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007425.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0611/run007427/event007427.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007425.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0611/run007428/event007428.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007425.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0612/run007429/event007429.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007425.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0612/run007431/event007431.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007430.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0612/run007432/event007432.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007430.dat &
wait
