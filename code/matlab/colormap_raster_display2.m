% Read the GeoTIFF file
file_path = "C:\Users\user\Desktop\raster\ds-project-raster-compare\code\output_samples\AQ_NYC_raster_overlayed_avg_pm25_geohash_7_1.tiff";
AQ_data2 = imread(file_path);
% Define nodata value
nodata_value = 0;  % Adjust based on your dataset
% Replace nodata values with NaN
AQ_data2(AQ_data2 == nodata_value) = NaN;
% Minimum and maximum PM2.5 values
minimum_PM25 = 2.0657861653999996;
maximum_PM25 = 12.31804457;
% Normalize the PM2.5 data
normalized_PM25 = (AQ_data2 - minimum_PM25) / (maximum_PM25 - minimum_PM25);
% Choose a colormap
chosen_colormap = hot; % Example: using the 'hot' colormap
% Map normalized PM2.5 values to colors
mapped_colors = ind2rgb(round(normalized_PM25 * (size(chosen_colormap, 1)-1) + 1), chosen_colormap);
% Find NaN values
nan_indices = isnan(AQ_data2); % Find NaN indices
%Find NaN values and set them to black
for i = 1:size(mapped_colors, 3)
    mapped_colors(:,:,i) = mapped_colors(:,:,i) .* ~nan_indices + nan_indices * 0;
end
% Display the raster data with the chosen colormap
figure;
imshow(mapped_colors);
colorbar;
% Customize the colorbar
caxis([minimum_PM25, maximum_PM25]); % Set colorbar limits to match the PM2.5 data range
colorbar('Ticks', [minimum_PM25, (minimum_PM25 + maximum_PM25) / 2, maximum_PM25], ...
         'TickLabels', {num2str(minimum_PM25), num2str((minimum_PM25 + maximum_PM25) / 2), num2str(maximum_PM25)});
colormap(hot)
title('PM2.5 Air Quality');
xlabel('Longitude');
ylabel('Latitude');