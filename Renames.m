%使用matlab批量修改文件名

% 设置文件夹路径
folderPath = 'C:\Users\dongxh\Desktop\试验数据\Origin绘图'; % 替换为你的文件夹路径
OldString = '压缩'; % 替换为你想要替换的旧字符串
NewString = 'YS'; % 替换为你想要替换成的新字符串

% 获取文件夹中所有.mat文件的信息
files = dir(fullfile(folderPath, '*.mat'));

% 循环遍历每个文件
for k = 1:length(files)
    oldName = files(k).name;
    % 检查文件名中是否包含旧字符串
    if contains(oldName, OldString)
        % 创建新文件名
        newName = strrep(oldName, OldString, NewString);
        % 完整的旧文件路径和新文件路径
        oldFullPath = fullfile(folderPath, oldName);
        newFullPath = fullfile(folderPath, newName);
        % 重命名文件
        movefile(oldFullPath, newFullPath);
        fprintf('Renamed %s to %s\n', oldName, newName);
    else
        fprintf('No match found in %s. Skipping.\n', oldName);
    end
end

fprintf('All matching files have been renamed.\n');
