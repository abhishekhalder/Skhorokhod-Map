function a = cummin(a) % return cumulative min of a vector
t = a(1);
for k = 2:length(a)
  if a(k) < t
    t = a(k);
  else
    a(k) = t;
  end
end