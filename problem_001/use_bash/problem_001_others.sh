#set -x
set -e
LIMIT=1000
# brute_force
# Iterate through the entire list.
# When you see a number divisible by 3 or 5, add it to the total.
brute_force()
{
  total=0
  for ((a=1; a < LIMIT ; a++))  # Double parentheses, and "LIMIT" with no "$".
  do
    if [[ $((a % 3)) == 0  ||  $((a % 5)) == 0  ]]; then
      total=$((total + a))
    fi
   done
   echo $total
}
brute_force
