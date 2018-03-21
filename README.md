# GasMaps
Hubs and Pipelines

We downloaded data from the Homeland Infrastructure Foundation Level Database. For major natural gas pipelines 
we use the shape file. For the location of the major hubs we use the available spreadsheet. 

Plots a map with the hubs and pipelines. Will use to find the closest hub for gas users. Can add those points to the maps
as appropriate. 

First time using geom_sf with a shapefile. 

Important learning was to add coord_sf(datum =NA) or whatever datum appropriate to avoid grid lines from geom_sf, 
apparently an unintended feature. 

Would like to learn how to find the routing from the pipeline shapefile between two points, a project for another time. 


