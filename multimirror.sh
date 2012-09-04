# script simples para criar e manter sincronizado um mirror de pacotes debian com debmirror
 
# criado por: guto carvalho
# contato: jose.accarvalho@gmail.com
# licença: Creative Common - Atribuição
# criado em: 2010-11-18
 
function _getdebs()
{
	debmirror --verbose --progress --arch=$1 --host=$2 --root=$3 --section=$4 --dist=$5 \
                  -e $6 --postcleanup --nosource --ignore-release-gpg --ignore-missing-release --ignore-small-errors $7
 
	# imprimindo informacoes
	echo -e "\n--- sincronizando mirror $3"
	echo "--- arch: $1"
	echo "--- dist: $5"
	echo -e "--- sections: $4 \n"
}
 
# mirror distro tal
# _getdebs [arch] [host] [root] [sections] [dist] [proto] [diretorio]
 
# squeeze
_getdebs amd64 sft.if.usp.br debian main,contrib,non-free squeeze http /media/sf_mirror/debian/squeeze/
 
# squeeze-security
_getdebs amd64 sft.if.usp.br debian-security main,contrib,non-free squeeze/updates http /media/sf_mirror/debian/squeeze-security/
 
# squeeze-updates
_getdebs amd64 sft.if.usp.br debian main,contrib,non-free squeeze-updates http /media/sf_mirror/debian/squeeze-updates/
 
# squeeze-backports
_getdebs amd64 sft.if.usp.br debian-backports main,non-free,contrib squeeze-backports http /media/sf_mirror/debian/squeeze-backports/

# lenny-backports
_getdebs amd64 backports.debian.org debian-backports main,contrib,non-free lenny-backports http /var/mirror/squeeze-backports

# squeeze-puppetlabs
_getdebs amd64 apt.puppetlabs.com / main squeeze http /media/sf_mirror/debian/squeeze-puppet

# lenny-puppetlabs
_getdebs amd64 apt.puppetlabs.com / main lenny http /media/sf_mirror/debian/lenny-puppet

# squeeze-davical
_getdebs amd64 debian.mcmillan.net.nz debian awm squeeze http /media/sf_mirror/debian/squeeze-davical
