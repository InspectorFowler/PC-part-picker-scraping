fetch_commodities <- function(){
  
  comm_list <- read_html("https://pcpartpicker.com/") %>%
    html_elements("a") %>%
    html_attr('href') %>%
    tibble::tibble() %>%
    setNames(c('elements')) %>%
    dplyr::filter(grepl('product',elements)) %>%
    dplyr::mutate(elements = str_replace(elements,'/products/','')) %>%
    rowwise() %>%
    dplyr::mutate(elements = str_split(elements, '/')[[1]][1]) %>%
    dplyr::filter(!elements %in% c('pricedrop','')) %>%
    distinct() %>%
    arrange(elements) %>%
    unlist()
  
  names(comm_list) <- seq(1:length(comm_list))
  
  return(comm_list)
}