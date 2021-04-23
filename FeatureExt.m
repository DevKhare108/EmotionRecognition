function [Features,Labels]=FeatureExt(fileNames)
    Features =[]; Labels=[];
    for i=1:length(fileNames)
        [ speech, fs ] = audioread( string(fileNames(i)) );
        % Feature extraction (feature vectors as columns)
        [ X ] = ...
                      mfcc( speech, fs, Tw, Ts, alpha, hamming, R, M, C, L );
        n=mean(X,2);
        Features = [Features n];
        if length(strfind(string(fileNames{i}),'_a'))==1
            Labels=[Labels;1];
        elseif length(strfind(string(fileNames{i}),'_d'))==1
            Labels=[Labels;2];
        elseif length(strfind(string(fileNames{i}),'_f'))==1
            Labels=[Labels;3];
        elseif length(strfind(string(fileNames{i}),'_h'))==1
            Labels=[Labels;4];
        elseif length(strfind(string(fileNames{i}),'_n'))==1
            Labels=[Labels;5];
        elseif length(strfind(string(fileNames{i}),'_sa'))==1
            Labels=[Labels;6];
        elseif length(strfind(string(fileNames{i}),'_su'))==1
            Labels=[Labels;7];
        else
            disp("WRONG DATA");
        end
    end