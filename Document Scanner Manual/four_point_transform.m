function  warped = four_point_transform(image,rect)

    widthA = round(sqrt((rect(1,1) - rect(2,1))^2 + (rect(1,2) - rect(2,2))^2))
    widthB = round(sqrt((rect(4,1) - rect(3,1))^2 + (rect(4,2) - rect(3,2))^2))
    maxWidth = max(widthA,widthB)
    
    heightA = round(sqrt((rect(1,1) - rect(4,1))^2 + (rect(1,2) - rect(4,2))^2))
    heightB = round(sqrt((rect(2,1) - rect(3,1))^2 + (rect(2,2) - rect(3,2))^2))
    maxHeight = max(heightA,heightB)
    
    dst = [ [1,1];[maxWidth,1];[maxWidth,maxHeight];[1,maxHeight]];
    tform = fitgeotrans(rect,dst,'projective')
    warped = imwarp(image,tform,'nearest','OutputView',imref2d(size(image)));
    warped = warped(1:maxHeight,1:maxWidth,:);

end