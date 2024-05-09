# Instructions
## follow the instructions

------------------------------------

recapitulating the few points and comments that we have discussed during our meeting yesterday of what need to be done:

- adding a layer with the value of another feature the geoTiff image. For example trip_distance in the taxi mobility data that you are using currently. As we discussed, better to focus your analysis on the NYC air quality data, adding pm value as a layer in addition to long/latitude of the points.
- Generating 1000 images (geoTIFF) from the data that you have by capturing samples from the data. Versify the samples for several images. For example, generate some images based on stratified-like sampling. Review the codes that we have discussed in the class, where we consider the geohash as a stratum and take the sample percentage (fraction) from each geohash bracket independently. Stratified sampling should generate maps (therefore images) with similar empirical distribution that resembles the population data (the original data). Also, generate some other images using sample fractions that are different from one neighbourhood to another, this should generate images that differ from the reference image with which you need to compare.
You keep one image generated as a reference image with which you want to search for the most similar image from the other 1000 images generated.
- Then your images search algorithm should proceed as follows: considering the reference image , you are searching a database of images for an image that is the most similar in terms of the underlying distribution of data. Then, you vectorize the reference image and extract the distribution of data into an array. For example, for the air quality data, the array should contain two columns, neighbourhood and average pm, with each row corresponding to a neighbourhood and the average pm value in that neighbourhood. You do the same for the other images. Thereafter, you only need to use metrics such as RMSE, MAPE, Jensen-Shannon , or KL divergence to compare the two distributions. For example, for RMSE, the-smaller-the-better applies, meaning that the image (from the 1000 search images) that has the smallest RMSE is the one that is most similar to the reference image.
I will update the instructions file with helpful materials, example starting code, and a recent paper that you can use as a reference to write the survey part (2-3 pages) of your final report for this project.

- find the example notebook titled `stratified-sampling-RMSE-mobility-NYC.ipynb` available in the `starting_code` folder of your repository [here](https://github.com/Dr-Isam-ALJAWARNEH/ds-project-raster-compare/blob/main/stating-code/NEW_April24/stratified-sampling-RMSE-mobility-NYC.ipynb) for calculating accuracy metrics (`RMSE`, `MAPE`, `Jenssen-Shannon` and `KL Divergence`), the idea is to compare the performance of some of those metrics in searching thematic maps, in terms of `speed` and the explainability of accuracy results. In this example notebook, RMSE was calculated by aggregating (grouping by) the `neighborhood`, then RMSE was calculated for the `count` query, that is to say, the count of taxi pickups is compared across all neighborhoods using the RMSE and MAPE. Jenssen-Shannon and KL Divergence was used to compare the `top-N` type of queries. So, my suggestion, in your design, after you `vectorize` the data, transform into an array, each array cell should contain the aggregated attribute for each neighborhood, for example `average pm` value. Beware however that the values in the two arrays should be well-calibrated for that to work, that is to say, first element of the first array (corresponding to original data for example) should be representing the same neighborhood as the equivalent (first element) element of the second array (the array representing the other image we are comparing with), non-calibrated data may lead to errors in RMSE values. Anyways, you are calculating the metrics on normalized array values (also the example notebook covers this), this is normally knwon as `normalized root-mean-square deviation or error (NRMSD or NRMSE)`, read about it here [NRMSE](https://en.wikipedia.org/wiki/Root-mean-square_deviation).

- So, in sumamry, the figures that you need to capture include x-y performance graphs, where x-axis represents for example `number of images` you are searching in, varying it for example from 100 to 500 (with step-size of 100, meaning that the bins in the x-axis are 100,200,300,400,500), then in the y-axis you capture two things, the time required to find the most simialr image, and the the RMSE (in addition to the other metrics such as JS, KL, and MAPE).

- Start in parallel writing your report for this project. For writing the survey part, your main reference paper is my recent paper titled `Efficient Generation of Approximate Region-based Geo-maps from Big Geotagged Data` [available online](https://ieeexplore.ieee.org/abstract/document/10478398). This is very much related paper and you can find useful information within it. I will also add other relevant references from the recent state-of-art to help you in choosing the right set of papers to write your survey part of your report.


----------------------------------------
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

     ```A CSV file is just a table and a TIFF is a raster image with data in each cell (pixel).  You will need to convert your tabular data to points then you can generate a raster from the point data.```
***The main research question is how to convert vector csv file into a raster tiff or geotiff image, this process is known as ```Rasterize``` ?!!*** 
Also, the opposite is interesting for us, 
> get some insights:
    - [Converting Vector (.shp) to Raster (.tiff) using Python GDAL library](https://stackoverflow.com/questions/59821554/converting-vector-shp-to-raster-tiff-using-python-gdal-library)
    - here is a very nice example starting code to ```rasterize```: [Rasterize (Vector Shapefile to Raster)](https://hydro-informatics.com/jupyter/geo-convert.html). look into the **Rasterize (Vector Shapefile to Raster section)**!!
    - [Raster to Polygon](https://hydro-informatics.com/jupyter/geo-convert.html)
    - this is also a very nice example [Convert between CSV and GeoTIFF with GDAL in Python](https://www.youtube.com/watch?v=zLNLG0j13Cw)
    - more instructions and starting code here: [Convert Between GeoTIFF and CSV](https://mapscaping.com/convert-between-geotiff-and-csv/)
    - and more! [Example - Convert dataset to raster (GeoTiff)](https://corteva.github.io/rioxarray/stable/examples/convert_to_raster.html)
    - [Rasterising vectors & vectorising rasters](https://docs.digitalearthafrica.org/en/latest/sandbox/notebooks/Frequently_used_code/Rasterise_vectorise.html)
    - [Working with Raster data](https://kodu.ut.ee/~kmoch/geopython2020/L5/raster.html)
    - [Convert Point Data to Raster](https://zia207.github.io/geospatial-python.io/lesson_06_working-with-raster-data.html#Convert-Point-Data-to-Raster)

***Team members***
- [Dr. Isam Al Jawarneh](https://isamaljawarneh.github.io/)
- [Eng. Ali A. Alsalama](your site or linkedin)
- [Eng. Ahmed A. Kubba](your site or linkedin)
