#!/bin/ksh

# @version: 0.0.2
# @errors:
# 0 - Success
# 1 - Invalid # of arguments
# 2 - Invalid directory specified
# 3 - Invalid arg specified

pattern=
directory=

# display script supported argument list
usage()
{
  echo "usage: $0 -p <filename pattern> -d <directory for recursive search>"
}

# verify arg count
if [[ ($# -ne 4) && ($# -ne 1) ]] ; then
  usage
  exit 1
fi

# process args
while test "$1" != "" ; do
    case $1 in
        --help|-h)
            usage
            exit 0
        ;;
        --pattern|-p)
            shift
            pattern=$1
        ;;
        --directory|-d)
            shift
            directory=$1

            if ! [[ -d "$1" ]] ; then
                echo "Error: target directory not found"
                exit 2
            fi
        ;;
        *)
            echo "Error: no such option $1"
            usage
            exit 3
        ;;
    esac
    shift
done

# find all matching files
files=`find $directory -name "$pattern"`

# search each file for null bytes
for i in ${files[@]}
do
  od -b < $i | grep -l ' 000' > /dev/null && echo $i
done

exit 0
