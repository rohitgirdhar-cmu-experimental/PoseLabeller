function lst = readList(fpath)
f = fopen(fpath);
lst = textscan(f, '%s');
lst = lst{1};
fclose(f);