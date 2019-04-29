function  [TrainF,TestF,TrainL,TestL] = divide_DB(Features,TrainLabels,TR)

% Inputs:
% Features : All features in matrix format with size of featurelength x Total features
% TrainLabels: Training Labels in pure numeric format.
% Training ratio: 0-1
% Output
% Divided Training and Testing features and labels vector.

TrainF = [];
TrainL = [];
TestF = [];
TestL = [];

% Get total lables
Lables1 = unique(TrainLabels);

% Find out total classes
Nclass = length(Lables1);

for nn = 1:Nclass
    
    % Get index of all the features with nth class
    ix1 = find(TrainLabels==nn);
    
    % Divide them based on given percentage
    % No of training instace
    Ntrain = ceil(TR*length(ix1));
    
    % Generate random number
    Rnum = randperm(length(ix1));
    
    % Take first Ntrain into training and remaining in test class
    TrainF = [TrainF Features(:,ix1(Rnum(1:Ntrain)))];
    TrainL = [TrainL  TrainLabels(:,ix1(Rnum(1:Ntrain)))];
    TestF = [TestF Features(:,ix1(Rnum(Ntrain+1:end)))];
    TestL = [TestL TrainLabels(:,ix1(Rnum(Ntrain+1:end)))];
    
    
end
TestF = Features;
TestL = TrainLabels;