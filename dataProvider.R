download_data <- function(){
  if(!file.exists("./data/exdata%2Fdata%2FNEI_data.zip")){
    fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
    download.file(fileUrl, destfile = "./data/exdata%2Fdata%2FNEI_data.zip")
  }
  unzip("./data/exdata%2Fdata%2FNEI_data.zip", exdir = "./data")
}

get_SCC <- function(){
  if(!file.exists("./data/Source_Classification_Code.rds")){
    download_data()
  }
  SCC <- readRDS("./data/Source_Classification_Code.rds")
}

get_NEI <- function(){
  if(!file.exists("./data/summarySCC_PM25.rds")){
    download_data()
  }
  NEI <- readRDS("./data/summarySCC_PM25.rds")
}