Self-Organizing-Map
===================

Character Recognition with self-organizing map

    At first the training images are resized to have the size of 30 × 30 pixels i.e. each image can be considered to be in R30×30 or in R900. The self organizing map (SOM) used here consists of 10 ∗ 10 = 100 map nodes arranged in a 10 × 10 grid. There are 900 input nodes (equal to the number of pixels of each training image). Each input node connects to all the map nodes but none of the map nodes connect to each other.
    
    Each map node is associated to a feature vector whose dimension is equal to the number of input nodes. So in this case the feature vectors ∈ R900. With an untrained map, the feature vectors would start out with random values between -1 and 1. In this way the map is setup, it now has to be trained.
    
    The training stage starts by feeding each training image to the input nodes of the map. The SOM then goes through each map node to find which map node’s feature vector matches best the input training image. The winning map node i.e the map node whose feature vector is most similar to the input image is called the Best Match Unit (BMU). The BMU’s feature vector is then adjusted to more closely match the input. The neighbor map nodes of the BMU have their feature vectors adjusted as well. The closer the neighbor is to the BMU, the more their feature vector values are adjusted. The further away, the less is the adjustment.
    
    The training of the SOM, by applying the training image set, happens for many iterations (called epochs). Each time an epoch passes, two things are changed : the learning rate and the neighborhood size. One can start out with a high learning rate, so that the map adjusts quickly to the training set. Over time, the learning rate decreases to let the feature vectors stabilize. The neighborhood size is the distance away from the BMU that map nodes will have their feature vectors adjusted. This typically starts out at around half the size of the map. So if the map is a 10 × 10 one then the neighborhood size starts out at length 5. As time progresses the neighborhood size decreases to 1, so that only the BMU has its weights adjusted.
    
    To classify a test image, compare it with all the converged feature vectors of the map nodes and return the map node with the most similar feature vector to the test image.
