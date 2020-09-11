currentEpochTime=$(date +%s)

USE_MULTICORE=true ARTILLERY_WORKERS=46 artillery run --output report.json test/first_test.yml
artillery report --output report.html report.json
aws s3 cp ./report.html s3://k-nextors-non-prod-perf-testing/artillery/report-${currentEpochTime}.html
