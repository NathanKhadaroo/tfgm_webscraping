
# Load packages: ----------------------------------------------------------

library(cronR) # Schedule R Scripts and Processes with the 'cron' Job Scheduler, CRAN v0.4.2
library(dplyr) # A Grammar of Data Manipulation, CRAN v1.0.2
library(readr) # Read Rectangular Text Data, CRAN v1.3.1

# Tell cron which script to run: ------------------------------------------

cmd <- cron_rscript("tfgm_webscrape.R")

# Start schedule: ---------------------------------------------------------

cron_add(command = cmd,
         frequency = "minutely",
         id = "job",
         description = 'scrapes_scoot_from_tfgm')

# Stop schedule: ----------------------------------------------------------

cronR::cron_clear()

# Merging files: ----------------------------------------------------------

data <- list.files(path="Data", full.names = TRUE) %>% 
  lapply(read_csv) %>% 
  bind_rows %>%
  arrange(scoot_name)

# Saving the data: --------------------------------------------------------

data %>%
  write_csv("Data/scoot_data.csv")
