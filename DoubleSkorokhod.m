function [y,z] = DoubleSkorohod(x,L,U)

% -Inf < L < U < +Inf

y_L_Inf = cummax(max([L*ones(size(x)) - x; zeros(1,length(x))]));

z_L_Inf = x + y_L_Inf;
  
PlusTerm = max([z_L_Inf - U*ones(size(x)); zeros(1,length(x))]);

for j = 1:length(x)
    % store shrinkmin of each subvector of z_L_Inf in cell InfTerm
     InfTerm{j} = shrinkmin(z_L_Inf(1:j) - L*ones(size(z_L_Inf(1:j)))); 
        
     r(j) = max(min([PlusTerm(1:j); InfTerm{j}]));
end
  
z = z_L_Inf - r; 

y = z - x;
