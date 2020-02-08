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
# Feature Request: Have better search terms

curl -s https://airtable.com/careers > jobdata/Airtable
curl -s https://about.gitlab.com/jobs/apply/ > jobdata/Gitlab
curl -s https://www.linuxfoundation.org/about/careers/ > jobdata/LinuxFoundation
curl -s https://careers.mozilla.org/listings/ > jobdata/Mozilla
curl -s https://wikimediafoundation.org/about/jobs/ > jobdata/WikiMediaFoundation
curl -s https://duckduckgo.com/hiring/ > jobdata/DuckDuckGo
curl -s https://www.joyent.com/about/careers > jobdata/Joyent
curl -s https://bandcamp.com/jobs > jobdata/Bandcamp
#curl -s https://weworkremotely.com/remote-jobs/search?utf8=%E2%9C%93&audit=term > jobdata/WeWorkRemote-Audit
curl -s https://automattic.com/work-with-us/#open-positions > jobdata/Automattic
curl -s https://www.chef.io/careers/open-positions/ > jobdata/Chef.io
#curl -s https://careers-redhat.icims.com/jobs/search?ss=1&searchLocation=12781-12827-Remote > jobdata/RedHat-TX-Remote
curl -s https://stripe.com/jobs/search?l=remote > jobdata/Stripe

# Look within folder
cd jobdata

## Auditor Jobs
echo "Beginning Report for Auditor Jobs"
grep -iRl "Auditor" >> reports/Auditor_Jobs.txt
echo "\n" >> reports/Auditor_Jobs.txt
sed -i "1i Found Jobs Matching 'Auditor' At:" reports/Auditor_Jobs.txt
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
