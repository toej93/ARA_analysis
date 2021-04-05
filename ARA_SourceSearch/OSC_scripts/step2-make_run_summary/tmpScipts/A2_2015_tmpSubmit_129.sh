#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=01:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0609/run005697/event005697.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005693.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0609/run005699/event005699.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005698.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0609/run005700/event005700.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005698.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0609/run005701/event005701.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005698.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0610/run005702/event005702.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005698.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0610/run005704/event005704.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005703.dat &
wait
