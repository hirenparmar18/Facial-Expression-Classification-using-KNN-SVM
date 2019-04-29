
function [img] = Normalise_image(img)
	um=100;
	ustd=80;
    side = 100;
    
    % Get size of image
    [rows, cols, channels] = size(img);
	if channels == 3
		img = rgb2gray(img);
    end
    
    % Convert to double size
    img = double(img);
    
	% Normalize 	
    temp=reshape(img, rows*cols,1);
    m=mean(temp);
    st=std(temp);
    img=reshape((temp-m)*ustd/st+um,rows,cols);

    

    img = imresize(img, [side, side], 'bilinear');

end