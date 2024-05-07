filename = 'AQ_latest.tiff';
[pm25, R] = geotiffread(filename);

first_layer = pm25(:,:,1);

imagesc(first_layer);
colormap('jet'); 
colorbar;
title('PM2.5 Values');
xlabel('Longitude');
ylabel('Latitude');
