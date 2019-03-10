
(
    trap "sleep 5 && exit 1" ERR

    dir_path=$( dirname $BASH_SOURCE )/init
    modules=$( ls $dir_path )
    if [ "$( echo "$modules" | grep "^$1$" )" == "" ]
    then
        echo "$modules"
    else
        . $dir_path/$1/init.sh
    fi
)
