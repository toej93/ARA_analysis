#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0509/run007232/event007232.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007229.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0510/run007233/event007233.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007229.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0510/run007235/event007235.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007234.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0510/run007240/event007240.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007234.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0511/run007241/event007241.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007234.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0511/run007242/event007242.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007234.dat &
wait
