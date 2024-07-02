function NL_image = CustomDehaze(LL_image)

%size of the inputed image
[rows,columns,bands] = size(LL_image);

%converting the image to double for the calculations
LL = double(LL_image);

%inverting the image
temp = 255*ones(rows,columns,bands);
inv = temp - LL;

%==========================================================================
%calculating the value of global illumination A
%==========================================================================
R_min = min(inv,[],3);
%finding the indices of the 100 biggest pixel values
R_row = reshape(R_min,[1,rows*columns]);
top_100_un = unique(maxk(R_row,100));
member = ismember(inv,top_100_un);
R_mul = member.*inv;
R_sum = sum(R_mul,3);
[val,ind] = max(R_sum,[],'all');
[x,y] = find(R_sum==val);
A = inv(x(1),y(1),:);

%==========================================================================
%finding t(x)
%==========================================================================
%we will use a 3x3 window so we need padding
R_pad = padarray(inv,[1,1],'replicate');

t = zeros(rows,columns);
for row=2:(rows+1)
    for column=2:(columns+1)
        r = min((R_pad((row-1):(row+1),(column-1):(column+1),1))./A(:,:,1),[],'all');
        g = min((R_pad((row-1):(row+1),(column-1):(column+1),2))./A(:,:,2),[],'all');
        b = min((R_pad((row-1):(row+1),(column-1):(column+1),3))./A(:,:,3),[],'all');
        values = [r,g,b];
        min_val = min(values);
        t(row-1,column-1) = 1 - 0.8*min_val;
    end
end

%==========================================================================
%calculating the values of multiplier P(x)
%==========================================================================
P = zeros(rows,columns);

for row=1:rows
    for column=1:columns
        if t(row,column)<0.5
            P(row,column) = 2*t(row,column);
        else
            P(row,column) = 1;
        end
    end
end

%==========================================================================
%calculating J(x)
%==========================================================================
J = zeros(rows,columns,bands);

for row=1:rows
    for column=1:columns
        for band=1:bands
            J(row,column,band) = ((inv(row,column,band)-A(:,:,band))/(P(row,band)*t(row,band)))+A(:,:,band);
        end
    end
end

%inverting the result
final_inv = temp - J;

NL_image = uint8(final_inv);


