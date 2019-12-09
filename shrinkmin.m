function b = shrinkmin(a) % return shrinking min of a vector

b = zeros(size(a));

for k = 1:length(a)
    b(k) = min(a(k:end));
end

