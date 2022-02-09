# labour-market-areas
This repo contains all the files from the [LabourMarketAreas: Identification, Tuning, Visualisation and Analysis of Labour Market Areas](https://cran.r-project.org/web/packages/LabourMarketAreas/index.html)


# Algorithm

1. Takes as input a list of tuples. Each tuple has an origin zone, a destination zone and a flow.
2. Creates and list of all zones.
3. Each zone is allocated to a seperate protoTTWA.
4. The protoTTWAs are ordered from best to worst (according to "size" and "self-containment").
5. Call the worst protoTTWA `worst_ttwa`. If `worst_ttwa` meets the *requirements* set, then **STOP**. If not then move to step 6.
6. From `worst_ttwa` the worst zone is removed, call it `worst_zone`.
7. Take `worst_zone` and compare it with the protoTTWA that produces the largest improvement. 
    - If this improvement is negative then put `worst_zone` in the reserve list.
        - If `worst_ttwa` meets the *requriements* set (without `worst_zone`) then *group reserve list zones to protoTTWAs without comparison* and move to step 4.
        - Else move to step 7.
    - Else group `worst_zone` with the other protoTTWA:
        - If `worst_ttwa` meets the *requriements* set (without `worst_zone`) then **STOP**.
        - Else move to step 6. 

# Directories

## scr 
This directory contains the code used to run the findClusters function on the 2015 dataset on the cloud.

## R
This directory contains the code from the [LabourMarketAreas package](https://cran.r-project.org/web/packages/LabourMarketAreas/index.html) and the modified version. 

## notebooks 
This directory contains three notebooks:
1. runs.Rmd: contains the code needed to run the modified version of findClusters
2. comparing_clusters_from_example_data.Rmd: contains the code needed to identify how many clusters match exactly from the R and FORTRAN algorithms using the example data (714 clusters)
2. inspecting_r_2015_output.Rmd: contains the code needed to load the output from the R algorithm using the 2015 data. Only 4 clusters were generated. 

## remaining directories
The remaining directories (data, man) support the LabourMarketAreas Package.
