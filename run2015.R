library(LabourMarketAreas)
library(here)
library(janitor)
library(dplyr)


input_data_2015 <- read_delim(here::here("data/input_data/2015/ttwalsoa.csv"),
                              delim = ";",
                              escape_double = FALSE,
                              trim_ws = TRUE) %>%
  janitor::clean_names()

input_data_2015 <- input_data_2015 %>%
  mutate(community_live = as.integer(as.factor(living)),
         community_work = as.integer(as.factor(working))) %>%
  rename(amount = totalmoves) %>%
  select(-c("living", "working"))

system.time(
  output_2015_data  <- findClusters(LWCom = input_data_2015,
                                    minSZ = 3500,
                                    minSC= 0.6667,
                                    tarSZ = 25000,
                                    tarSC = 0.75,
                                    verbose = TRUE)
)

saveRDS(output_2015_data, "output_2015_data.RDS")

