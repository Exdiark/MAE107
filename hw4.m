A = [6,-1;12,8;-5,4]
B = [4,0;.5,2]
C = [2,-2;-3,1]
transpose(A)
transpose(B)
transpose(C)

x = [1,2,-1,2;5,2,2,9;-3,5,-1,1]
gauss(x)

gauss([20,-10,0,19.62;-10,10,-10,29.43;0,-10,10,24.525])

x = [210,37,36;60,176,93;75,27,261]/2895 * [3300;1200;2400]
x = [210,37,36;60,176,93;75,27,261]/2895 * [2600;850;2400]

function out = transpose(x)
    row = size(x,1);
    col = size(x,2);
    for i=1:col
        for j=1:row
            out(i,j) = x(j,i);
        end
    end
end

function out = gauss(x)
    l = size(x,1);

    %iterate through matrix and eliminate elements below diagonal
    for j=1:l
        %partial pivoting
        d = x(j,:);
        ind = 0;
        max = 0;
        %find largest element
        for i=j:l
            if abs(x(i,j)) > max
                max = abs(x(i,j));
                ind = i;
            end
        end
        %swap rows
        x(j,:) = x(ind,:);
        x(ind,:) = d;

        %iterate through rows below the pivot
        for i=j+1:l
            x(i,:) = x(i,:) - x(i,j)*x(j,:)./x(j,j);
        end
    end

    %reduce elements for solutions
    for j=1:l
        x(j,:) = x(j,:)./x(j,j);
    end

    %iterate back through list and eliminate elements above diagonal
    for i=0:l-1
        for j=i:l-2
            x(l-j-1,:) = x(l-j-1,:) - x(l-j-1,l-i) * x(l-i,:);
        end
    end
    out = x;
end
