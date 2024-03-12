# Instructions
## follow the following instructions
1. [ ] run the example starting code and familiarize yourself with some geosaptial processing techniques, including:
    - sampling
    - spatial join
    - geo-visualization
3. [ ] start by performing Exploratory Data Analytics (EDA) for the data
    > for example:
        - historgrams to study the distribution of data (you have three sensors)
        - ```Kernel Density (univariate, aspatial)```
        - get insights from the following:
    - [02_geovisualization](https://darribas.org/gds_scipy16/ipynb_md/02_geovisualization.html)
    - [Exploratory Spatial Data Analysis (ESDA)](https://darribas.org/gds_scipy16/ipynb_md/04_esda.html)
    - [NYC Data](https://github.com/PacktPublishing/Geospatial-Data-Science-Quick-Start-Guide/blob/master/Chapter02/NYC%20Data.ipynb)
    - [Performing Spatial operations like a Pro](https://github.com/PacktPublishing/Geospatial-Data-Science-Quick-Start-Guide/blob/master/Chapter03/Chapter3.ipynb) such as ```Spatial join```
> also,
> - Exploratory Spatial Data Analysis (ESDA) [example](https://darribas.org/gds_scipy16/ipynb_md/04_esda.html), such as ```Spatial Autocorrelation```
> - Exploratory Spatial and Temporal Data Analysis (ESTDA), [example](https://darribas.org/gds_scipy16/ipynb_md/05_spatial_dynamics.html), such as ```Spaghetti Plot```, ```Kernel Density (univariate, aspatial)```, ```Markov Chains```, and ```Spatial Markov```, [Spatial Autocorellation](https://github.com/PacktPublishing/Geospatial-Data-Science-Quick-Start-Guide/blob/master/Chapter04/Chapter4.ipynb), and [GLobal Spatial Autocorrelation](https://github.com/PacktPublishing/Geospatial-Data-Science-Quick-Start-Guide/blob/master/Chapter04/Chapter4.ipynb)
4. [ ] Find the example notebook titled ```ratser.ipynb```. 
    > you need to convert a ```vector``` data in csv file into a ```raster`` equivalent and store it in .geotiff format. This process entails a demand to first develop a sampling scheme that iteratevely samples data at random paces from the csv file to generate several geotiff iamges (one image for each sample). All samples are drawn from the same area. then simply to compare the images, find their pixel representation (e.g., store the representation in an array), then use the arrays as distributions to compare using the Root Mean Square Error (RMSE). The target is to find an image that is most simialr to a reference image (a.k.a. query image).  
5. Then, given a reference image, Find the image that is nearest to this reference image, nearest in terms of similar distributions measured by RMSE. The lowest the RMSE, the more similar the images compared! 

***The main research question is how to convert vector csv file into a raster tiff or geotiff image, this process is known as ```Rasterize``` ?!!*** 
Also, the opposite is interesting for us, 
> get some insights:
    - [Converting Vector (.shp) to Raster (.tiff) using Python GDAL library](https://stackoverflow.com/questions/59821554/converting-vector-shp-to-raster-tiff-using-python-gdal-library)
    - here is a very nice example starting code to ```rasterize```: [Rasterize (Vector Shapefile to Raster)](https://hydro-informatics.com/jupyter/geo-convert.html). look into the **Rasterize (Vector Shapefile to Raster) section**!!
    - [Raster to Polygon](https://hydro-informatics.com/jupyter/geo-convert.html)
***Team members***
- [Dr. Isam Al Jawarneh](https://isamaljawarneh.github.io/)
- [your name](your site or linkedin)
- [your name](your site or linkedin)