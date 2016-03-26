# Add ansible user
/usr/sbin/groupadd ansible
/usr/sbin/useradd ansible -g ansible -G wheel
echo "ansible"|passwd --stdin ansible
echo "ansible        ALL=(ALL)       NOPASSWD: ALL" >> /etc/sudoers.d/ansible
chmod 0440 /etc/sudoers.d/ansible

# Installing ansible keys
mkdir -pm 700 /home/ansible/.ssh
wget --no-check-certificate 'https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub' -O /home/vagrant/.ssh/authorized_keys
chmod 0600 /home/ansible/.ssh/authorized_keys
chown -R ansible /home/ansible/.ssh
