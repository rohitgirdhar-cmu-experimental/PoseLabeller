function labels = getLabels(I)
% returns a 14x1 vector with the position of the 14 parts
% Order is same as LEEDS dataset
% Use left mouse for visible, and right mouse for not visible

parts = {'Rank', 'Rkne', 'Rhip', ...
         'Lhip', 'Lkne', 'Lank', ...
         'Rwri', 'Relb', 'Rsho', ...
         'Lsho', 'Lelb', 'Lwri', ...
         'neck', 'head'};
labels = zeros(3, numel(parts));
imshow(I);
part_id = 1;
while part_id <= numel(parts)
    fprintf('Mark out %s\n', parts{part_id});
    [x, y, button] = ginput(1);
    vis = (button == 1); % = 1 when left mouse was pressed 
    fprintf('Read (%f, %f, %d) for %s\n', x, y, vis, parts{part_id});
    fprintf('Now, (r)edo? (c)ontinue?\n');
    while (waitforbuttonpress == 0)
        fprintf('Now, (r)edo? (c)ontinue?\n');
    end
    p = get(gcf, 'CurrentCharacter');
    if p == 'r'
        fprintf('Redo-ing...\n');
    elseif p == 'c'
        fprintf('Continuing...\n');
        part_id = part_id + 1;
    end
end
