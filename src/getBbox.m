function rect = getBbox(I)
% returns a 4x1 vector which is [xmin ymin xmax ymax]

imshow(I);
done = false;
while (~done)
    fprintf('Mark out a box around the human\n');
    rect = getrect();
    rect(3) = rect(3) + rect(1);
    rect(4) = rect(4) + rect(2);
    rect(rect < 0) = 0;

    for i = [1, 3]
        if rect(i) > size(I, 2)
            rect(i) = size(I, 2);
        end
    end
    for i = [2, 4]
        if rect(i) > size(I, 1)
            rect(i) = size(I, 1);
        end
    end
    fprintf('Now, (r)edo? (c)ontinue?\n');
    waitforbuttonpress;
    p = get(gcf, 'CurrentCharacter');
    if p == 'c'
        done = true;
    end
end

