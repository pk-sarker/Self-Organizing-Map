function Weight = trainSOM(folder,resizedShape)
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

   totalNodes = 100;
   Weight = rand(resizedShape(1)*resizedShape(2),totalNodes);

   ita0 = 0.1;
   itaN = ita0;

   tau2 = 1000;

   [I,J] = ind2sub([10,10],1:100);

   Ntrain = size(ImageData,2);

   %alpha = 0.5;

   sig0 = 200;

   sigN = sig0;

   tau1 = 1000/log(sigN);

   for i=1:1000
       for j=1:Ntrain
           x = ImageData(:,j);
           dist = sum(sqrt((Weight - repmat(x,1,totalNodes)).^2),1);
           [value,pos] = min(dist);
           ri = [I(pos),J(pos)];
           %distance between all the nodes to the winner node.
           dist = 1/(sqrt(2*pi)*sigN).*exp(sum((([I(:),J(:)] - repmat(ri,totalNodes,1)).^2),2)...
                  /(-2*sigN))*itaN;
           for ii = 1:totalNodes
               Weight(:,ii) = Weight(:,ii) + dist(ii).*(x - Weight(:,ii));
           end
       end
       itaN = ita0*exp(-i/tau2);
       sigN = sig0*exp(-i/tau1);
   end

   figure
   axis off
   hold on
   for jj = 1:totalNodes
       %[lr,lc] = ind2sub([10,10],jj);
       subplot(10,10,jj);
       axis off;
       imagesc(reshape(Weight(:,jj),resizedShape(1),resizedShape(2)));
       colormap(gray(256));
       axis off;
   end
   hold off
   
end

