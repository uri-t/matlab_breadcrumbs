function [] = save_bc()

% get source of script which generated figure
stack = get(gcf, 'UserData');

if numel(stack) == 1
    comment = 'unavailable';
elseif stack(end).file
    fname_src = which(stack(end).name);
    src = fileread(fname_src);
    comment = sprintf('File: %s \n Source: %s \n', fname_src, src);
else
    comment = sprintf('Source: %s \n', stack(end).name);
end


% save figure as png with source code in EXIF
[name,path] = uiputfile('*.png');
fname = fullfile(path,name);

if ~name
    return
end

assert(strcmpi(fname(end-3:end),'.png'), ...
    'Images must be saved in png format')

saveas(gcf, fname)
imdata = imread(fname);
imwrite(imdata, fname, 'Comment', comment)
end