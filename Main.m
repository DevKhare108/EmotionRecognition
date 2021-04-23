
% Read speech samples, sampling rate and precision from file
dd = dir('*.wav');
fileNames = {dd.name};
Labels=[];
DC={};JE={};JK={};KL={};

for i=1:length(fileNames);
    %To construct CodeBook, Features have to be normalized
    %for each of the 4 people.
    
    if length(strfind(string(fileNames{i}),'DC'))==1
        DC{end+1}=string(fileNames{i});
    elseif length(strfind(string(fileNames{i}),'JE'))==1
        JE{end+1}=string(fileNames{i});
    elseif length(strfind(string(fileNames{i}),'JK'))==1
        JK{end+1}=string(fileNames{i});
    elseif length(strfind(string(fileNames{i}),'KL'))==1
        KL{end+1}=string(fileNames{i});
    else
        disp("WRONG DATA");
    end
    
end  

[DC_data,DC_L]=FeatureExtraction(DC);
[JE_data,JE_L]=FeatureExtraction(JE);
[JK_data,JK_L]=FeatureExtraction(JK);
[KL_data,KL_L]=FeatureExtraction(KL);

% [DC_data,DC_L]=FeatureExt(DC);
% [JE_data,JE_L]=FeatureExt(JE);
% [JK_data,JK_L]=FeatureExt(JK);
% [KL_data,KL_L]=FeatureExt(KL);

CodeBook_data = [normalize(DC_data,2,'range')...
                               normalize(JE_data,2,'range')...
                               normalize(JK_data,2,'range')...
                               normalize(KL_data,2,'range')];

CodeBook_L = [DC_L; JE_L; JK_L; KL_L];
% FeatureVecs=[normalize(FeatureExtraction(a),2,'range')...
%                         FeatureExtraction(d)...
%                     FeatureExtraction(f) FeatureExtraction(h)...
%                     FeatureExtraction(n) FeatureExtraction(sa)...
%                     FeatureExtraction(su)]';
for j=1:39
T=PCA(CodeBook_data',j);
for i=1:30
    [Test, Train, Test_L,Train_L] =...
        SplitingData(T', CodeBook_L,10);
    % SplitingData(T', CodeBook_L,10);
    % 48 is 10% of 480
    [GMM]=makeGMM(Train,Train_L,7);
    [result]=classifyGMM(GMM,Test);
    acc(i)=mean(result'==Test_L);
    [result]=classifyGMM(GMM,Train);
    acc_train(i)=mean(result'==Train_L);
end
Acc(j)=mean(acc);
Acc_Train(j)=mean(acc_train);
end


plot(Acc), 
xlabel('Feature Size (Changed using PCA)'), ylabel('Accuracy')
title('Accuracy of Testing Data for Reduced Features from 1-39')





