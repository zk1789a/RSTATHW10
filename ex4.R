cases_us <- read_csv("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_US.csv")

tidy_cases <- cases_us %>% 
  select(state='Province_State',country='Country_Region', c(`1/22/20`:`10/27/20`))

pivot_cases_us <- 
  tidy_cases %>% 
  pivot_longer(cols = c(`1/22/20`:`10/27/20`), names_to = "date", values_to = "cases") %>% 
  group_by(state,country,date) %>% 
  summarize(cases=max(cases))