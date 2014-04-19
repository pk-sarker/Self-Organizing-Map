function testSOM(folder,resizedShape,Weight)
 %test the model using the test dataset
 srcFiles1 = dir([folder,'*.jpg']);  % the folder in which ur images exists
 figure
 axis off
 for i = 1 : length(srcFiles1)
    filename = strcat(folder,srcFiles1(i).name);
    Im = double(imread(filename));
    if size(Im,3) == 3
       Im = rgb2gray(Im);
    end
    Im = imresize(Im,resizedShape);
    subplot(121),imagesc(Im),colormap(gray(256)),title('Input Image');
    x = Im(:);
    dist = sum(sqrt((Weight - repmat(x,1,size(Weight,2))).^2),1);
    [~,pos] = min(dist);
    %ri = [I(pos),J(pos)];
    matchedImage = Weight(:,pos);
    matchedImage = reshape(matchedImage,resizedShape(1),resizedShape(2));
    subplot(122),imagesc(matchedImage),colormap(gray(256)),title('Best Match');
    pause
    
    %ImageData(:,i) = I(:);
 end


end

