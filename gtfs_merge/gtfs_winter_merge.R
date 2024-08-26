# GTFS WINTER MERGE

agency <- read.csv("C:/Users/Lola/Documents/SCMTD/WINTER_2024/WINTER_GTFS/agency.txt",  header = TRUE)
routes <- read.csv("C:/Users/Lola/Documents/SCMTD/WINTER_2024/WINTER_GTFS/routes.txt",  header = TRUE)
trips <- read.csv("C:/Users/Lola/Documents/SCMTD/WINTER_2024/WINTER_GTFS/trips.txt",  header = TRUE)
stop_times <- read.csv("C:/Users/Lola/Documents/SCMTD/WINTER_2024/WINTER_GTFS/stop_times.txt",  header = TRUE)
stops <- read.csv("C:/Users/Lola/Documents/SCMTD/WINTER_2024/WINTER_GTFS/stops.txt",  header = TRUE)

routes_join <- left_join(agency, routes, c("agency_id"))

trips_join <- left_join(routes_join, trips, c("route_id"))

stop_times_join <- left_join(trips_join, stop_times, c("trip_id"))

stops_join <- left_join(stop_times_join, stops, c("stop_id"))

winter_merge <- stops_join

write.csv(winter_merge, "C:/Users/Lola/Documents/SCMTD/WINTER_2024/winter_gtfs_merge.csv")
