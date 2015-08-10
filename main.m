function main(imgsdir, imgslistfpath, outdir)
addpath('src/');
if ~exist('imgsdir', 'var')
    imgsdir = '/media/data-nix/work/cmu/datasets/0001_BackpagePose/Images/corpus/';
end
if ~exist('imgslistfpath', 'var')
    imgslistfpath = '/media/data-nix/work/cmu/datasets/0001_BackpagePose/Images/lists/Images.txt';
end
if ~exist('outdir', 'var')
    outdir = '/media/data-nix/work/cmu/datasets/0001_BackpagePose/Labels/Pose/';
end

imgslist = readList(imgslistfpath);
i = 0;
for imid = imgslist(:)'
    clear labels bbox;
    i = i + 1;
    outfpath = fullfile(outdir, [num2str(i) '.mat']);
    if exist(outfpath, 'file')
        load(outfpath);
        if exist('labels', 'var') && exist('bbox', 'var')
            continue;
        end
    end
    impath = fullfile(imgsdir, imid{:});
    I = imread(impath);
    if ~exist('labels', 'var')
        labels = getLabels(I);
    end
    if ~exist('bbox', 'var')
        bbox = getBbox(I);
    end
    save(outfpath, 'labels', 'bbox');
    fprintf('Done for %d / %d (%s)\n', i, numel(imgslist), impath);
end