% WRITE YOU CODE HERE!!!_
fprintf('Visualizing example dataset for PCA.\n\n');

%  The command below loads the dataset 
load ('pcadata.mat');
plot(X(:, 1), X(:, 2), 'bo');
axis([0.5 6.5 2 8]); axis square;
pause;
fprintf('Program paused. Press enter to continue.\n');
fprintf('\nRunning PCA on example dataset.\n\n');
[Xmu, mu] = subtractMean(X);%Takes the value of x from subtractMean and stores in Xmu and mu.  
[U, S] = myPCA(Xmu);%stores Xmu vale in the form of matrix as the vales U&S.
pause;
hold on;
drawLine(mu, mu + 0.5 * S(1,1) * U(:,2)', '-r', 'LineWidth', 2);%Draws a red color line in the plot.
drawLine(mu, mu + 0.5 * S(1,1) * U(:,1)', '-g', 'LineWidth', 2);%Draws a green color line in the plot. 
hold off;
pause;
fprintf('Top eigenvector: \n');
fprintf(' U(:,1) = %f %f \n', U(1,1), U(2,1));
fprintf('\n(you should expect to see -0.707107 -0.707107)\n');
fprintf('Program paused. Press enter to continue.\n');
fprintf('\nDimension reduction on example dataset.\n\n');
plot(Xmu(:, 1), Xmu(:, 2), 'bo');%this plots the normalized dataset.
axis([-4 3 -4 3]); axis square
K = 1;
Z = projectData(Xmu, U, K);
fprintf('Projection of the first example: %f\n', Z(1));
fprintf('\n(this value should be about 1.481274)\n\n');
X_rec  = recoverData(Z, U, K,mu);%stores the values from the file recoverData.
fprintf('Approximation of the first example: %f %f\n', X_rec(1, 1), X_rec(1, 2));
fprintf('\n(this value should be about  -1.047419 -1.047419)\n\n');
hold on;
for i=1:size(Xmu,1)
    plot(X_rec(:, 1), X_rec(:, 2), 'ro');%This projects the points rom the initial point to the final one.
end
hold off

fprintf('Program paused. Press enter to continue.\n');
pause;

%FACE DATASET
fprintf('\nLoading face dataset.\n\n');
load ('pcafaces.mat')%  Load Face dataset
displayData(X(1:200, :));
fprintf('Program paused. Press enter to continue.\n');
fprintf(['\nRunning PCA on face dataset.\n' ...
         '(this might take a minute or two ...)\n\n']);
[Xmu, mu] = subtractMean(X);%stores the value of X in Xmu and mu.
[U, S] = myPCA(Xmu);%Run the PCA.
displayData(X(1:100, :)) %display the data.
fprintf('Program paused. Press enter to continue.\n');
fprintf('\nDimension reduction for face dataset.\n\n');
K = 100;
Z = projectData(Xmu, U, K);
fprintf('The projected data Z has a size of: ')
fprintf('%d ', size(Z));
fprintf('\n\nProgram paused. Press enter to continue.\n');
fprintf('\nVisualizing the projected (reduced dimension) faces.\n\n');
K = 100;
X_rec  = recoverData(Z, U, K,mu);%take values from the recoverData.
subplot(1, 2, 1);
displayData(Xmu(1:100,:));%normalized data is being displayed.
title('Original faces');
axis square;
subplot(1, 2, 2);
displayData(X_rec(1:100,:));%This displays the reconstructed data.
title('Recovered faces');
axis square;

fprintf('Program paused. Press enter to continue.\n');



