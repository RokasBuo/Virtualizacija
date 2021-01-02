
#!/bin/sh
CUSER=openNebulaUsername
CPASS=openNebulaPassword
read -p "Enter name for new VM(without spaces): " VNAME
read -n 1 -p "Will this be Client VM(only web browser)? |y|n|: " PRPS
VMTEMPLATE=
case $PRPS in
        y | Y) VMTEMPLATE="debian10-lxde"
                ;;
        n | N) VMTEMPLATE="debian10-virt-project"
                ;;
        *) echo
           echo "'$PRPS' is invalid entry"
           exit 1
                ;;
esac
CENDPOINT=https://grid5.mif.vu.lt/cloud3/RPC2
CVMREZ=$(onetemplate instantiate "$VMTEMPLATE"  --name $VNAME  --user $CUSER --password $CPASS  --endpoint $CENDPOINT)
if (( $(echo $?) != 0 )); then
        echo
       echo "$CVMREZ" && exit 1
fi
echo
CVMID=$(echo $CVMREZ |cut -d ' ' -f 3)
echo "VM id: $CVMID"
echo "Waiting for VM to RUN 20 sec."
sleep 20
$(onevm show $CVMID --user $CUSER --password $CPASS  --endpoint $CENDPOINT > ${VNAME}_${CVMID}.txt)
CSSH_CON=$(cat ${VNAME}_${CVMID}.txt | grep CONNECT\_INFO1| cut -d '=' -f 2 | tr -d '"')
CSSH_PRIP=$(cat ${VNAME}_${CVMID}.txt | grep PRIVATE\_IP| cut -d '=' -f 2 | tr -d '"')
if [[ "$VMTEMPLATE" == "debian10-lxde" ]]; then
        $(echo "Works only if user was created using ansible" > clientLogin.txt)
        $(cat ${VNAME}_${CVMID}.txt | grep CONNECT\_INFO1| cut -d '=' -f 2 | tr -d '"'|sed 's/'$CUSER'/client/' >> clientLogin.txt )

fi

echo "Connection string: $CSSH_CON"
echo "Local IP: $CSSH_PRIP"
#echo "Will delete VM $CVMID"
#$(onevm delete $CVMID --user $CUSER --password $CPASS --endpoint $CENDPOINT )
exit 0
