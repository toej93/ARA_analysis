#!/usr/bin/python3
## file: submit_jobs.py
import os
import csv, subprocess

home = os.path.expanduser('~')
parameter_file_full_path = home + "/testDir/jobs_mult_params/week42/job_params.csv"

with open(parameter_file_full_path, mode='r', newline='', encoding='utf-8-sig') as csvfile:
    reader = csv.reader(csvfile)
    for job in reader:
        submit_command = ("sbatch "
            "--job-name={0}_{1} "
            "--export=WEEK={0},SOURCE={1},DATA={2} template_1.sh").format(*job)

        print(submit_command)# Uncomment this line when done testing to use the submit command created
        # uncomment the following 3 lines when done testing to submit the jobs
#        exit_status = subprocess.call(submit_command, shell=True)
#        if exit_status is 1:  # Check to make sure the job submitted
#            print("Job {0} failed to submit".format(submit_command))
print("Done submitting jobs!")
