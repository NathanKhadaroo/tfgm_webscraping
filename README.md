# Webscraping scoot sensor data from tfgm API

 Contains code to scrape scoot sensor data from the tfgm API.
 
 This repo contains three R scripts:
 
- "tfgm_webscrape.R" has the code for acessing the data, cleaning the data, and saving the output. The subscription key has been removed for security reasons. To obtain a subscription key, create an account at https://developer.tfgm.com .

- scheduling_unix.R uses the cron daemon to run "tfgm_webscrape.R" once every minute. Use this if you are using a unix device. This file also contains code for merging outputs from "tfgm_webscrape.R".

- scheduling_windows.R uses the taskscheduler app to run "tfgm_webscrape.R" once every minute. Use this if you are using a windows device. This file also contains code for merging outputs from "tfgm_webscrape.R".

