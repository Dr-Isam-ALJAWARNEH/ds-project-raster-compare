% Read the GeoTIFF file
file_path = 'AQ_NYC_raster2.tiff';
AQ_data = imread(file_path);

% Define nodata value
nodata_value = -9999;  % Adjust based on your dataset

% Replace nodata values with NaN
AQ_data(AQ_data == nodata_value) = NaN;

% custom_colormap = hot;
% custom_colormap(1, :) = [0.5 0.5 0.5]; % FOR SETTING NaN to GREY

%unique_values = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
%num_colors = numel(unique_values);

%custom_colormap = zeros(num_colors + 1, 3);  % Initialize colormap
%custom_colormap(1, :) = [0, 0, 0];  % Set the first color to black for NaN
%for i = 1:num_colors
    % Generate unique color for each value
    %custom_colormap(i + 1, :) = hsv2rgb([i / num_colors, 1, 1]);
%end

% Display the raster data
figure;
imagesc(AQ_data);
colormap(hot);  % Use 'jet' colormap instead of 'viridis'
colorbar;

% Customize the plot
title('PM2.5 Air Quality');
xlabel('Longitude');
ylabel('Latitude');
