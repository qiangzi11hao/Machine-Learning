function [J grad ] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)
%NNCOSTFUNCTION Implements the neural network cost function for a two layer
%neural network which performs classification
%   [J grad] = NNCOSTFUNCTON(nn_params, hidden_layer_size, num_labels, ...
%   X, y, lambda) computes the cost and gradient of the neural network. The
%   parameters for the neural network are "unrolled" into the vector
%   nn_params and need to be converted back into the weight matrices. 
% 
%   The returned parameter grad should be a "unrolled" vector of the
%   partial derivatives of the neural network.
%

% Reshape nn_params back into the parameters Theta1 and Theta2, the weight matrices
% for our 2 layer neural network
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

% Setup some useful variables
m = size(X, 1);
         
% You need to return the following variables correctly 
J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));

% ====================== YOUR CODE HERE ======================
% Instructions: You should complete the code by working through the
%               following parts.
%
% Part 1: Feedforward the neural network and return the cost in the
%         variable J. After implementing Part 1, you can verify that your
%         cost function computation is correct by verifying the cost
%         computed in ex4.m
%
% Part 2: Implement the backpropagation algorithm to compute the gradients
%         Theta1_grad and Theta2_grad. You should return the partial derivatives of
%         the cost function with respect to Theta1 and Theta2 in Theta1_grad and
%         Theta2_grad, respectively. After implementing Part 2, you can check
%         that your implementation is correct by running checkNNGradients
%
%         Note: The vector y passed into the function is a vector of labels
%               containing values from 1..K. You need to map this vector into a 
%               binary vector of 1's and 0's to be used with the neural network
%               cost function.
%
%         Hint: We recommend implementing backpropagation using a for-loop
%               over the training examples if you are implementing it for the 
%               first time.
%
% Part 3: Implement regularization with the cost function and gradients.
%
%         Hint: You can implement this around the code for
%               backpropagation. That is, you can compute the gradients for
%               the regularization separately and then add them to Theta1_grad
%               and Theta2_grad from Part 2.

Z1 = [ones(m, 1) X];
a1=Z1;
Z2=Z1*Theta1';
a2=[ones(size(Z2,1),1) sigmoid(Z2)];
Z3=a2*Theta2';
a3=sigmoid(Z3);
h=a3;
Y=zeros(size(a3));
for i=1:size(y,1)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
    Y(i,y(i))=1;
end;
J=sum(diag(-Y*log(h')-(1-Y)*log(1-h')))/m+lambda*(sum(sum(Theta2(:,2:hidden_layer_size + 1).^2))+sum(sum(Theta1(:,2:input_layer_size + 1).^2)))/(2*m);

J1=sum(sum((h-Y).^2))/50000
Delt1=zeros(size(Theta1));
Delt2=zeros(size(Theta2));
delt3=a3-Y;
delt2=delt3*Theta2(:,2:hidden_layer_size + 1).*sigmoidGradient(Z2);
Delt1=Delt1+delt2'*a1;
Delt2=Delt2+delt3'*a2;
for i=1:hidden_layer_size
    for j=1:input_layer_size + 1
        if j==1
            Theta1_grad(i,j)=Delt1(i,j)/m;
        else
            Theta1_grad(i,j)=Delt1(i,j)/m+lambda*Theta1(i,j)/m;
        end
    end
end;

for i=1:num_labels
    for j=1:hidden_layer_size + 1
        if j==1
            Theta2_grad(i,j)=Delt2(i,j)/m;
        else
            Theta2_grad(i,j)=Delt2(i,j)/m+lambda*Theta2(i,j)/m;
        end
    end
end;










% -------------------------------------------------------------

% =========================================================================

% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];


end
