
# Load packages: ----------------------------------------------------------

library(taskscheduleR) # # Schedule R Scripts/Processes with Windows Task Scheduler, CRAN v1.4
library(dplyr) # A Grammar of Data Manipulation, CRAN v1.0.2
library(readr) # Read Rectangular Text Data, CRAN v1.3.1

# Tell taskscheduler which script to run: ---------------------------------

myscript <- file.path("C:", "CCAP_project", "tfgm_webscrape.R")

# Start schedule: ---------------------------------------------------------

taskscheduler_create(taskname = "tfgm_scrape",
                     rscript = myscript,
                     schedule = "MINUTE",
                     starttime = format(Sys.time(), "%H:%M"))

# Stop schedule: ----------------------------------------------------------

taskscheduler_delete(taskname = "tfgm_scrape")

# Merging files: ----------------------------------------------------------

data <- list.files(path="Data", full.names = TRUE) %>% 
  lapply(read_csv) %>% 
  bind_rows %>%
  arrange(scoot_name)

