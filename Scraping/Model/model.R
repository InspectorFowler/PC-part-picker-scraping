
#####################################################################################################
# Environment
#####################################################################################################

# Set path
setwd('Github/PC-part-picker-scraping/Scraping/')

# load libraries
suppressMessages(easypackages::libraries('tibble','tidyverse','rvest','logger','RSelenium'))

# load functions
invisible(sapply(paste0('Functions/',list.files('Functions/',pattern = "*.R", recursive = T)),source,.GlobalEnv))

# Set log level
logger::log_threshold(logger::DEBUG)

# Scientific options
options(scipen = 999) # scientific option

#####################################################################################################
# Fetch commodities
#####################################################################################################

comm_list <- fetch_commodities()

rD <- rsDriver(port = 4456L, chromever = "90.0.4430.24")
remDr <- rD[["client"]]

remDr$navigate("https://pcpartpicker.com/products/video-card/#page=1")

devtools::install_github("ingonader/rgeizhals")


get_geizhals_data("https://geizhals.eu/?cat=gra16_512", max_pages = 1)


url_geizhals <- "https://geizhals.at/?cat=acam35"
listpagehtml_list <- fetch_all_listpages(url_geizhals, max_pages = 2)
dat_listpage <- parse_all_listpages(listpagehtml_list)
## get url of a single detail page and read html:
url_detailpage <- dat_listpage[["detailpage_url"]][1]
detailpagehtml <- xml2::read_html(url_detailpage)
## get prices summary:
calc_price_summary(detailpagehtml)
