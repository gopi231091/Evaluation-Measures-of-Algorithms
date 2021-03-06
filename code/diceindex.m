% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function to claculate dice index for particular thresholds of all
% algorithmsa nd all images
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc;clear all; close all;

groundPath  = 'Ground Truth\';

%thresholds at which jaccard index will be computed
thresholds = [50 80 40 100 70 120];
nalgs = 6;

for nalg = 1:nalgs
    
    algPath = ['alg', num2str(nalg)];
    
    files = dir([algPath, '\*.tif']);
    
    
    for nimage = 1:length(files)
        Imalg = imread([algPath, '\', files(nimage).name]);
        ground = imread([groundPath, '\', files(nimage).name]);
        
        Imground = (ground > 0);
        
        %threshold the Imalg image
        Im = (Imalg > thresholds(nalg));
        
        %get jaccard index
        dindx = 2 * nnz (Im & Imground) / (nnz (Im) + nnz (Imground));
        
        disp(['The dice index for alg' ,num2str(nalg),', img',num2str(nimage),' is ',num2str(dindx)]);
        
    end
    
end
