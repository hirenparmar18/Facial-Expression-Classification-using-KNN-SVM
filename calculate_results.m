function [TP,TN,FP,FN,sensitivity,specificity,precision,F1_score] = calculate_results(gknown,gpred)
% load a

CM = confusionmat(gknown(:),gpred(:));

% Calculate True Positive and True negative
D = diag(CM);

% Divide confustion matrix in class1 and class2
% no of true class 1 instances
nr = ceil(length(D)/2);

% Total instances in class 1
Nc1 = sum(sum(CM(1:nr,:)));
Nc2 = sum(sum(CM(nr+1:end,:)));

% Take half as true positive
TP = sum(D(1:nr))/Nc1;
TN = sum(D(nr+1:end))/Nc2;
FP = 1-TN;
FN = 1-TP;

% 
sensitivity = TP/(TP+FN);
specificity = TN/(TN+FP);
precision = TP/(TP+FP);
F1_score = 2*(precision*sensitivity)/(precision+sensitivity);

