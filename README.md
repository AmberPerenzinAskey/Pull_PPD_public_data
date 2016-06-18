## Pull_PPD_public_data
## Summary
This script will read in publically available police data from opendataphilly.org. After reading in the data, the script will select part 1 violent crime  for each year. Violent crime incidents are aggregated into one file. The output will be a .csv file that contains violent crime incidents from 2006-2010 (N should be 133,600)
### Notes
* Crime codes are stored in the factor variable "UCR_GENERAL"
* Crime codes 100, 200, 300 & 400 represent part 1 violent crime
