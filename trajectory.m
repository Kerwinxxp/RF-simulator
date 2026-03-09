classdef trajectory
    properties
        Name
        Start
        End
        Geopoints
        TargetLatLon
        Angles
        AngleMode
        BeamwidthDeg
    end

    methods
        function is_Valid = isValidEnd(obj, x, y)
            if sqrt((x - obj.Start(1))^2 + (y - obj.Start(2))^2) >= 100
                is_Valid = true;
            else
                is_Valid = false;
            end
        end

        function lat_lon_table = getPath(obj)
            node_count = min(100, width(obj.Geopoints));
            lat_lon_table = zeros(node_count, 2);
            for i = 1:node_count
                lat_lon_table(i,1) = obj.Geopoints(1, i).Latitude;
                lat_lon_table(i,2) = obj.Geopoints(1, i).Longitude;
            end
        end

        function lat_lon_table = syncCordinates(obj, tbl)
            lat_lon_table = zeros(100, 2);
            for i = 1:height(obj.Geopoints)
                lat = obj.Geopoints(i).Latitude;
                for j = 1:(height(tbl) - 1)
                    if (lat > tbl(j,1) && lat < tbl(j+1,1)) || (lat < tbl(j,1) && lat > tbl(j+1,1))
                        right_diff = lat - tbl(j,1);
                        left_diff = lat - tbl(j+1,1);
                        if(abs(right_diff) < abs(left_diff))
                            lat_lon_table(i,1) = tbl(j,1);
                        else
                            lat_lon_table(i,1) = tbl(j+1,1);
                        end
                        break;
                    end
                end
                lon = obj.Geopoints(i).Longitude;
                for j = 1:(height(tbl) - 1)
                    if (lon > tbl(j,2) && lon < tbl(j+1,2)) || (lon < tbl(j,2) && lon > tbl(j+1,2))
                        right_diff = lon - tbl(j,2);
                        left_diff = lon - tbl(j+1,2);
                        if(abs(right_diff) < abs(left_diff))
                            lat_lon_table(i,2) = tbl(j,2);
                        else
                            lat_lon_table(i,2) = tbl(j+1,2);
                        end
                        break;
                    end
                end
            end
        end
    end
end
