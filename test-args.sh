#"/bin/bash

echo "$@"

declare -a args

args=("$@")

for arg in args
    do
      shift
      printf "\nArg: $arg \n"
done

printf "\n All: $@ \n"

echo $args
