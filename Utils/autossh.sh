#!/bin/sh
#
# The script will automatically generate and install RSA public/private key pairs to a list of hosts
# where access is required with no password.
#

host="$1"
port="$2"
username="$3"
password="$4"
file=$(echo hostname | md5sum | sed 's|  -||g' | cut -c1-5)
name=$(shuf -i 1-100000 -n 1)

if [ "${host}" = "" ]; then
  echo "Syntax: $0 host port username password"
  exit 1
fi

ssh-keygen -b 2048 -t rsa -f /root/.ssh/"$file$name" -q -N "" <<< $'\ny' >/dev/null 2>&1

export SSHPASS="$password"
sshpass -e ssh-copy-id -i /root/.ssh/"$file$name".pub -o StrictHostKeyChecking=no "$username"@"$host"

echo "" >> /root/.ssh/config
echo "Host $file$name $host" >> /root/.ssh/config
echo "    HostName $host" >> /root/.ssh/config
echo "    User $username" >> /root/.ssh/config
echo "    Port $port" >> /root/.ssh/config
echo "    IdentityFile /root/.ssh/$host" >> /root/.ssh/config
echo "done"
echo "try : ssh $username@$host"