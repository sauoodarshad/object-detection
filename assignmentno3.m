I = imread('fru12.jpg');
Ibw = im2bw(I);
figure, imshow(Ibw);
Ibw = imfill(Ibw, 'holes');
Ibw = medfilt2(Ibw,[9 9],'symmetric');
se10 = strel('disk',10);
Ibw = imclose(Ibw,se10);
figure, imshow(Ibw);
Ilabel = logical(Ibw);
stat = regionprops(Ilabel, 'centroid');
figure, imshow(I); 
hold on;
for x = 1: numel(stat)
    plot(stat(x).Centroid(1), stat(x).Centroid(2), 'ro');
end

