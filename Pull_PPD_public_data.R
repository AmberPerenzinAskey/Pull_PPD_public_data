# this script will read in publically available police data from opendataphilly.org
# after reading in the data, the code will select part 1 violent crime  for each year
        # crime codes are stored in the factor variable "UCR_GENERAL"
        # codes 100, 200, 300 & 400 represent part 1 violent crimes
# once the subset of violent crimes has been queried for each year, 
# violent crime incidents for all years are aggregated into one file
# output will be a .csv file that contains violent crime incidents from 2006-2010 (N should be 133,600)


#set working directory
setwd(dir = "C:/Users/Amber/Documents/practice_github")


# read.csv files from opendata philly
# might need to run these commands more than once
# sometimes get this error:
        # Error in file(file, "rt") : cannot open the connection
        # In addition: Warning message:
        #        In file(file, "rt") : cannot open: HTTP status was '202 Accepted'

incidents_2006 <- read.csv("http://data.phl.opendata.arcgis.com/datasets/6b910edd9ca74577b50eab71564772f4_0.csv")
incidents_2007 <- read.csv("http://data.phl.opendata.arcgis.com/datasets/06fdccfe795a4bd7b32160ada1d37178_0.csv")
incidents_2008 <- read.csv("http://data.phl.opendata.arcgis.com/datasets/9a2a182643de40e18a1b831a7d7de49b_0.csv")
incidents_2009 <- read.csv("http://data.phl.opendata.arcgis.com/datasets/03964472996c49ca913e07507d3dd28f_0.csv")
incidents_2010 <- read.csv("http://data.phl.opendata.arcgis.com/datasets/768db9016a7e48b6a53f705c6eacd4cc_0.csv")
incidents_2011 <- read.csv("http://data.phl.opendata.arcgis.com/datasets/4ce9d9633e814d2ba455423dce9e8d9a_0.csv")
incidents_2012 <- read.csv("http://data.phl.opendata.arcgis.com/datasets/27ffa39726514ba8a433131d67498fa9_0.csv")

# save each file as a dataframe
incidents_2006.df <- data.frame(incidents_2006)
incidents_2007.df <- data.frame(incidents_2007)
incidents_2008.df <- data.frame(incidents_2008)
incidents_2009.df <- data.frame(incidents_2009)
incidents_2010.df <- data.frame(incidents_2010)
incidents_2011.df <- data.frame(incidents_2011)
incidents_2012.df <- data.frame(incidents_2012)

# would like to iterate the rest of this in a list
# not sure how
# will go one line at a time for now

# select violent crime records only and drop columns that are not needed
incidents_2006.df <- subset(incidents_2006.df, UCR_GENERAL == 100|UCR_GENERAL == 200|UCR_GENERAL == 300|UCR_GENERAL == 400, select = c("POINT_X", "POINT_Y", "UCR_GENERAL"))
incidents_2007.df <- subset(incidents_2007.df, UCR_GENERAL == 100|UCR_GENERAL == 200|UCR_GENERAL == 300|UCR_GENERAL == 400, select = c("POINT_X", "POINT_Y", "UCR_GENERAL"))
incidents_2008.df <- subset(incidents_2008.df, UCR_GENERAL == 100|UCR_GENERAL == 200|UCR_GENERAL == 300|UCR_GENERAL == 400, select = c("POINT_X", "POINT_Y", "UCR_GENERAL"))
incidents_2009.df <- subset(incidents_2009.df, UCR_GENERAL == 100|UCR_GENERAL == 200|UCR_GENERAL == 300|UCR_GENERAL == 400, select = c("POINT_X", "POINT_Y", "UCR_GENERAL"))
incidents_2010.df <- subset(incidents_2010.df, UCR_GENERAL == 100|UCR_GENERAL == 200|UCR_GENERAL == 300|UCR_GENERAL == 400, select = c("POINT_X", "POINT_Y", "UCR_GENERAL"))
incidents_2011.df <- subset(incidents_2011.df, UCR_GENERAL == 100|UCR_GENERAL == 200|UCR_GENERAL == 300|UCR_GENERAL == 400, select = c("POINT_X", "POINT_Y", "UCR_GENERAL"))
incidents_2012.df <- subset(incidents_2012.df, UCR_GENERAL == 100|UCR_GENERAL == 200|UCR_GENERAL == 300|UCR_GENERAL == 400, select = c("POINT_X", "POINT_Y", "UCR_GENERAL"))


#count rows to check subset was correct (2006 should be 21,796)
nrow(incidents_2006.df) #N=21,796
nrow(incidents_2007.df) #N=20,053
nrow(incidents_2008.df) #N=20,099 
nrow(incidents_2009.df) #N=18,573
nrow(incidents_2010.df) #N=17,963
nrow(incidents_2011.df) #N=17,791
nrow(incidents_2012.df) #N=17,325

# combine years into 1 file
vio.inct.2006.2012 <- rbind(
        incidents_2006.df, 
        incidents_2007.df, 
        incidents_2008.df, 
        incidents_2009.df,
        incidents_2010.df,
        incidents_2011.df,
        incidents_2012.df
)

# check n
nrow(vio.inct.2006.2012) #N=133,600 violent crime incidents between 2006 and 2012

# Write CSV in R
write.csv(vio.inct.2006.2012, file = "incidents_2006_2012.csv")

# that's it!
