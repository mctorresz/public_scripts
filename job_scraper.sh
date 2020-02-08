#! /bin/bash
# Requiremens: N/A

# Folder Setup
rm -r jobdata/
mkdir jobdata
rm -r jobdata/reports/
mkdir jobdata/reports

# File Setup
# Feature request: Output based on time date, currently erases what is there.
rm Archive_Report.txt
mv Final_Report.txt Archive_Report.txt

# Scrape Websites
# Feature request: Have search cycle through keywords

curl https://airtable.com/careers > jobdata/Airtable
curl https://about.gitlab.com/jobs/apply/ > jobdata/Gitlab

# Look within folder
cd jobdata

## Audit Jobs
echo "Beginning Report for Audit Jobs"
grep -iRl "Audit" >> reports/Audit_Jobs.txt
echo "\n" >> reports/Audit_Jobs.txt
sed -i "1i Found Jobs Matching 'Audit' At:" reports/Audit_Jobs.txt
echo 

## Security Jobs
echo "Beginning Report for Security Jobs"
grep -iRl "Security" >> reports/Security_Jobs.txt
echo "\n" >> reports/Security_Jobs.txt
sed -i "1i Found Jobs Matching 'Security' At:" reports/Security_Jobs.txt
echo 

## Analytics Jobs
echo "Beginning Report for Data Analytics Jobs"
grep -iRl "Data Analytics" >> reports/Analytics_Jobs.txt
echo "\n" >> reports/Analytics_Jobs.txt
sed -i "1i Found Jobs Matching 'Analytics' At:" reports/Analytics_Jobs.txt
echo 


# Export Final Report
cd ..
cat jobdata/reports/*.txt >> Final_Report.txt

# Feature request: Upload to git
# Feature request: Send report as email
