# add_then_sub
# Iterate by 3's, accumulating the numbers.
# Iterate by 5's, adding those in as well.
# Iterate by 15's, subtracting those (since we've added these numbers twice).
LIMIT=1000
add_then_sub()
{
  total=0

  for ((a=0; a < LIMIT ; a+=3))
  do
    total=$(($total + a))
  done

  for ((a=0; a < LIMIT ; a+=5))
  do
    total=$(($total + a))
  done

  for ((a=0; a < LIMIT ; a+=15))
  do
    total=$(($total - a))
  done

  echo $total
}
add_then_sub
