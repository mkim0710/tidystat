# https://chatgpt.com/c/67650904-e4bc-800e-a99b-0d8302c24fd6
# git log 
# git ls-tree -r -l <commit-hash> | awk '{ sum += $4 } END { print sum }'
git ls-tree -r -l HEAD | awk '{ sum += $4 } END { print sum }'
# echo "116265035 / 1048576" | bc -l
git ls-tree -r -l HEAD | sort -k4 -n | tail
