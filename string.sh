#!/bin/bash
RUNFILE=string.run.sh
touch ${RUNFILE} &> /dev/null
chmod 777 ${RUNFILE}
VAR={a..z}
for ((t=0;t<10;t++))
do
STRING=${STRING}${VAR}
#echo ${STRING}
cat <<END > ${RUNFILE}
#!/bin/bash
for i in ${STRING}
do 
echo "zzz  \${i}"
done
exit 0
END
./${RUNFILE}
done

exit
