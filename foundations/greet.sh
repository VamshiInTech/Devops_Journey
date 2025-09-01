#!/bin/bash


greet() {
    echo "Good $2, $1! Welcome to the DevOps training."
}

if [ $# -lt 2 ]; then
    echo "Usage: $0 <TimeOfDay> <Name1> ,[Name2> ....]"
    exit 1
fi

time_of_day=$1
formatted="${time_of_day,,}"
formatted="${time_of_day^}"
shift


# check if first arg is a time word (morning/afternoon/evening/night)
case "${1,,}" in
    morning|afternoon|evening|night)
        formatted="${1^}"  # capitalize first letter
        shift
        ;;
    *)
        # no time given → detect automatically
        hour=$(date +%H)
        if [ $hour -ge 5 ] && [ $hour -lt 12 ]; then
            formatted="Morning"
        elif [ $hour -ge 12 ] && [ $hour -lt 17 ]; then
            formatted="Afternoon"
        elif [ $hour -ge 17 ] && [ $hour -lt 21 ]; then
            formatted="Evening"
        else
            formatted="Night"
        fi
        ;;
esac

for name in "$@"; do
#    echo "Good "$time_of_day" "$name"! Welcome to the Devops Learning "
     greet "$name" "$formatted"
done


