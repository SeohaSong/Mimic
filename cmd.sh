
(
    trap "sleep 5 && exit 1" ERR

    if ! [ "$BASH_SOURCE" == "cmd.sh" ]
    then
        cd $( dirname $BASH_SOURCE )
    fi
    modules=$( ls tools/bash )
    if [ "$( echo "$modules" | grep "^$1$" )" == "" ]
    then
        echo "$modules"
    else
        args=$( echo $@ | cut -d " " -f 2- )
        . tools/bash/$1/init.sh $args
    fi
)
