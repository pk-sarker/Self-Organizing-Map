function Weight = trainSOMMATLAB(folder,resizedShape)
% finds the weights of the SOM nodes from the training images

   srcFiles = dir([folder,'*.jpg']);  % the folder in which ur images exists
   
   figure
   for i = 1 : length(srcFiles)
       filename = strcat(folder,srcFiles(i).name);
       I = double(imread(filename));
       if size(I,3) == 3
          I = rgb2gray(I);
       end
       I = imresize(I,resizedShape);
       imagesc(I),colormap(gray(256));
       pause(.1)
       ImageData(:,i) = I(:);
   end

   net = selforgmap([10 10]);
   net = train(net,ImageData);
   Weight = net.IW;
   Weight = Weight{:};
   Weight = Weight';


   figure
   axis off
   hold on
   for jj = 1:size(Weight,2)
       %[lr,lc] = ind2sub([10,10],jj);
       subplot(10,10,jj);
       axis off;
       imagesc(reshape(Weight(:,jj),resizedShape(1),resizedShape(2)));
       colormap(gray(256));
       axis off;
   end
   hold off
   
end