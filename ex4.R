cases_us <- read_csv("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_US.csv")

pivot_cases_us <- 
  cases_us %>% 
  pivot_longer(cols = c(`1/22/20`:`10/27/20`), names_to = "date", values_to = "cases") %>% 
  group_by(Province_State,Country_Region,date) %>% 
  summarize(cases=max(cases))