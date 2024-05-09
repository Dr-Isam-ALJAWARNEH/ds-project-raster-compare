% Read the GeoTIFF image
imageFile = 'C:\Users\aslam\Desktop\foundation_of_data\foundation of data science\output\Taxi_NYC_400.tiff'; % Replace 'your_image.tif' with the path to your GeoTIFF image
info = geotiffinfo(imageFile); % Get information about the GeoTIFF
[A, R] = geotiffread(imageFile); % Read the image data and the spatial referencing object

% Convert the image data to a supported data type
A = double(A); % Convert to double

% Display the image
figure;
mapshow(A, R); % Display the GeoTIFF image
title('GeoTIFF Image'); % Set the title
xlabel('X'); ylabel('Y'); % Label the axes