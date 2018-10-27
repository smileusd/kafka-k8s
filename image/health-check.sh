#! /bin/bash
# usage:
# $1: zookeeper server address
# $2: broker id

r=`bin/run-class.sh org.apache.zookeeper.ZooKeeperMain -server $1 <<< "ls /brokers/ids" | tail -1 | jq '.[]'`
ids=( $r )
echo $1 
echo $2
function contains() {
     local n=$#
     local value=${!n}
     for ((i=1;i < $#;i++)) {
         if [ "${!i}" == "${value}" ]; then
             echo "y"
             return 0
         fi
     }
     echo "n"
     return 1
}

function stripLeadingZero() {
    shopt -s extglob
    local val=${1##+(0)}
    shopt -u extglob
    x=${val:-0}
}

stripLeadingZero $2

if [ $(contains "${ids[@]}" "$x") == "y" ]; then echo "ok"; exit 0; else echo "doh"; exit 1; fi
