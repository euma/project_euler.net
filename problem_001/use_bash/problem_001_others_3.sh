# mult_then_sub
# Calculate the multiples of 3, 5, and 15 by doing multiplies,
# than sum (and adjust) the results.
LIMIT=1000
mult_then_sub()
{
  total=0

  threes=$(multiply 3)
  fives=$(multiply 5)
  both=$(multiply 15)

  total=$(( threes + fives - both ))
  echo $total
}

# multiply  -  Helper function for mult_then_sub
# Set $top as the greatest multiple of $mult less than $LIMIT.
# Then calculate ( top + mult ) * ( top / (2 * mult))
multiply()
{
   mult=$1
   top=$(( (LIMIT - 1) - ((LIMIT - 1) % mult) ))

   result=$(( (top + mult) * top / mult / 2 ))
   #there mult is bottom
   #top/mult is total item
   echo $result
}
mult_then_sub
