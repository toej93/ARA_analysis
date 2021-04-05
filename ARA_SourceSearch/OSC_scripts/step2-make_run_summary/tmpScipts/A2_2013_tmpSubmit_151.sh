#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=01:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2734/event2734.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002715/pedestalValues.run002715.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2735/event2735.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002715/pedestalValues.run002715.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2736/event2736.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002715/pedestalValues.run002715.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2737/event2737.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002715/pedestalValues.run002715.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2739/event2739.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002715/pedestalValues.run002715.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2740/event2740.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002715/pedestalValues.run002715.dat &
wait
