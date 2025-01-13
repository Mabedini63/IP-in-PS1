echo "show Netwok interface"
netif=`ip a | grep up |grep -v lo | cut -d ":" -f 2`
echo $netif
echo Enter name of Interface
read net
echo $net
IP=IP=$(ip -4 addr show $net | grep -oP '(?<=inet\s)\d+(\.\d+){3}')
echo $IP
echo You nees PS1 for root or other
read user
if [ $user = root ]
then
echo "PS1='\u@$IP \W#'"
else
echo "PS1='\u@$IP \W$'"
fi
cd
echo 'IP=IP=ip -4 addr show $net | grep -oP '(?<=inet\s)\d+(\.\d+){3}''
