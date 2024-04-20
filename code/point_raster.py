import pandas as pd
import geopandas as gpd
from geocube.api.core import make_geocube
from geocube.rasterize import rasterize_image
from functools import partial
from rasterio.enums import MergeAlg
from shapely.geometry import LineString

if __name__ == '__main__':
    # Read UK Accidents Point csvs
    Taxi_NYC = pd.read_csv(r'C:\Users\aslam\Desktop\foundation_of_data\foundation of data science\nyc1.csv')

    # Convert Long Lat into numeric type
    Taxi_NYC['Pickup_longitude'] = pd.to_numeric(Taxi_NYC['Pickup_longitude'])
    Taxi_NYC['Pickup_latitude'] = pd.to_numeric(Taxi_NYC['Pickup_latitude'])
    Taxi_NYC['Dropoff_longitude'] = pd.to_numeric(Taxi_NYC['Dropoff_longitude'])
    Taxi_NYC['Dropoff_latitude'] = pd.to_numeric(Taxi_NYC['Dropoff_latitude'])

    # Convert Long Lat into Point Geometry

    Taxi_NYC = gpd.GeoDataFrame(geometry = gpd.points_from_xy(x=Taxi_NYC['Pickup_longitude'], y=Taxi_NYC['Pickup_latitude']))

    print(Taxi_NYC)
    Taxi_NYC = Taxi_NYC.set_crs('EPSG:4326')

    # Reprojecting to 3857 coordinate system
    Taxi_NYC = Taxi_NYC.to_crs('EPSG:3857')
    Taxi_NYC['value'] = 1
    Taxi_NYC = Taxi_NYC[Taxi_NYC.is_valid]
    Taxi_NYC = Taxi_NYC[~Taxi_NYC.is_empty]
    
    # Using GeoCube to rasterize the Vector
    Taxi_NYC_raster = make_geocube(
        vector_data=Taxi_NYC,
        measurements=["value"],
        resolution=(-400, 400),
        rasterize_function=partial(rasterize_image, merge_alg=MergeAlg.add), 
        fill = 0
    )

    # save Taxi_NYC raster
    Taxi_NYC_raster.rio.to_raster(r'C:\Users\aslam\Desktop\foundation_of_data\foundation of data science\output\Taxi_NYC_0.0001.tiff')


