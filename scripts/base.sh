# Base install

sed -i "s/^.*requiretty/#Defaults requiretty/" /etc/sudoers

# cat > /etc/yum.repos.d/epel.repo << EOM
# [epel]
# name=Extra Packages for Enterprise Linux 7 - $basearch
# baseurl=http://download.fedoraproject.org/pub/epel/7/\$basearch
# mirrorlist=https://mirrors.fedoraproject.org/metalink\?repo=epel-7\&arch=\$basearch
# enabled=1
# gpgcheck=0
# EOM

yum -y install epel-release
yum -y install gcc make gcc-c++ kernel-devel-`uname -r` zlib-devel openssl-devel readline-devel sqlite-devel perl wget dkms nfs-utils net-tools
yum -y update
yum -y erase posfix

# Make ssh faster by not waiting on DNS
echo "UseDNS no" >> /etc/ssh/sshd_config
