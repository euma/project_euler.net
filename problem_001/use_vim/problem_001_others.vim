let sum = 0
for i in range(1000)
  if !(i % 3 && i % 5)
    let sum += i
  endif
endfor
echo sum
