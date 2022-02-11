% Q1
% A = [1 2 3; 3 3 4; 2 3 3];
% b = [1; 1; 2];
% x1 = A\b
% rref([A,b])
% U = echelon(A)
% L = A/echelon(A)
% y = L\b
% x2 = inv(U)*y

% Q3
% A = [3 -2 1; 2 6 -4; -1 -2 5];
% b = [-10; 44; -26];
% U = echelon(A)
% L = A/echelon(A)
% y = L\b
% x = U\y

% Q4
% A = [8 2 1; 3 7 2; 2 3 9];
% U = echelon(A)
% L = A/echelon(A)
% L*U
% detA = det(L) * det(U)

% Q6  
% A = [1 4 9 16 25; 4 9 16 25 36; 9 16 25 36 49; 16 25 36 49 64; 25 36 49 64 81]
% A1 = inv(A)
% sum(abs(A1),2)
% 
% for i=1:5
%     A(i,:) = A(i,:) / max(A(i,:));
% end
% A1 = inv(A)
% sum(abs(A1),2)
% sum(A(5,:))

% Q7
A = [16 4 1; 4 2 1; 49 7 1]
inv(A)

norm2(A)
frobnorm(A)

function out = echelon(A)
    m1 = A(2,1)/A(1,1);
    m2 = A(3,1)/A(1,1);
    A(2,:) = A(2,:) - m1*A(1,:);
    A(3,:) = A(3,:) - m2*A(1,:);
    m3 = A(3,2)/A(2,2);
    A(3,:) = A(3,:) - m3*A(2,:);
    out = A;
end

function out = norm2(A)
    A1 = inv(A);
    n1 = sqrt(max(sum(A.^2,2)));
    n2 = sqrt(max(sum(A1.^2,2)));
    out = n1*n2;
end

function out = frobnorm(A)
    A1 = inv(A);
    out = frob(A) * frob(A1);
end

function out = frob(A)
    out = 0;
    for i=1:3
        for j=1:3
            out = out + A(i,j)^2;
        end
    end
    out = out^.5;
end