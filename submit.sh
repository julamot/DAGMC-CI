
if [ -z $1 ]
then
   echo "Error: No run-spec specified"
   exit 1
fi

path=`pwd`
echo  \
"method = scp
scp_file = $path/null.sh
">$path/null.scp

echo "
method    = scp
scp_file  = $path/build.sh
">$path/build.scp

echo "
method    = scp
scp_file  = $path/build.SL6.sh
">$path/build.SL6.scp

echo "
method    = scp
scp_file  = $path/build.SL5.sh
">$path/build.SL5.scp

echo  \
"method = scp
scp_file = $path/gcc_SL6/*
recursive = true
">$path/gcc.SL6.scp

echo  \
"method = scp
scp_file = $path/gcc_SL5/*
recursive = true
">$path/gcc.SL5.scp

nmi_submit $1
