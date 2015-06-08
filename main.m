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
    i = i + 1;
    outfpath = fullfile(outdir, [num2str(i) '.mat']);
    if exist(outfpath, 'file')
        continue;
    end
    impath = fullfile(imgsdir, imid{:});
    I = imread(impath);
    labels = getLabels(I);
    save(outfpath, labels);
    fprintf('Done for %d / %d (%s)\n', i, numel(imgslist), impath);
end