function [] = update_filename(src, ev)
f = ancestor(src, 'figure');
f.UserData = dbstack;
end
