directory = 'dataset4/';
trajectory_count = 100;

region = readmatrix(strcat(directory, 'target_region.csv'));
for i = 1:trajectory_count
    trajectory = readmatrix(strcat(directory,'trajectory_',int2str(i),'.csv'));
    isContained = ismember(trajectory(:,1), region(:,1));
    if any(~isContained)
        disp("failed")
        break
    end
    isContained = ismember(trajectory(:,2), region(:,2));
    if any(~isContained)
        disp("failed")
        break
    end
end

disp("All Tests Successful")