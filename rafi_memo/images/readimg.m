% read image from the current directory and and save it in different
% format. 

dataout='/Users/xiew5/Desktop/OnlineExps/Rafi_memorability/stimuli';

curpath=pwd;
files=dir(fullfile(curpath,'*.jpeg'));

for ifile =1:length(files)
    ifile
    imdata= imread(fullfile(files(ifile).folder,files(ifile).name));
    
%     imdata=imresize(imdata,[nan 800]);
    
    
    imgID = sscanf(files(ifile).name,'%d.jpeg');
    if ~isempty(imgID)
        if imgID>=1000
            imgfilename= [num2str(imgID)];
        elseif imgID>=100 & imgID<999
            imgfilename= ['0' num2str(imgID)];
        elseif imgID>=10 & imgID<99
            imgfilename= ['00' num2str(imgID)];            
        elseif imgID>=1 & imgID<9
            imgfilename= ['000' num2str(imgID)];    
        end    
    elseif isempty(imgID)
        imgID = sscanf(files(ifile).name,'m%d.jpeg');
        
        if imgID>=1000
            imgfilename= ['m' num2str(imgID)];
        elseif imgID>=100 & imgID<999
            imgfilename= ['m0' num2str(imgID)];
        elseif imgID>=10 & imgID<99
            imgfilename= ['m00' num2str(imgID)];            
        elseif imgID>=1 & imgID<9
            imgfilename= ['m000' num2str(imgID)];    
        end
    end
    
    imwrite(imdata,fullfile(dataout,[imgfilename '.png']));
    
end