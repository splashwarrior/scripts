# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Aliash
alias ls='ls -al --color'
# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

#cd /local/mnt/workspace/agrawals
alias ls='ls --color'
#export OE_HOME="$HOME/oe/bitbake/bin/:"
#export PATH=/~/bin:/local/mnt/workspace/agrawals/scripts:/usr/sbin:/usr/bin:/bin:/usr2/agrawals/sink:$PATH
#export PATH="/local2/mnt/workspace/agrawals/pintos/pintos/src/utils:$PATH"
#export PATH="$HOME/.linuxbrew/bin:/$OE_HOME$PATH"
#export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
#export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"
export PATH="/home/siagrawal:/home/siagrawal/scripts:$PATH"
export SVN_EDITOR=/usr/bin/vim
export LS_COLORS='*.c=00;32:*.h=00;35:*.patch=00;34:':$LS_COLORS
export CSCOPE_EDITOR=/usr/bin/vim
#source ~/git/git-completion.sh
export HISTFILESIZE=900000
#export CSCOPE_DB=/local/mnt/workspace/agrawals/jb_mr1/kernel
export CSCOPE_DB=/home/siagrawal/
#export GIT_SSL_NO_VERIFY=1
#export R_INI=LNX.LA.3.6

# send email to once build is done
#alias mail_build='/usr2/agrawals/.linuxbrew/bin/buildkernel -f | tail --line=5 |
#sudo sendemail -f agrawals@quicinc.com -t agrawals@quicinc.com -u "buildbot"'
#alias email_me='echo  "Your build on machine "$HOSTNAME:$PWD "done" | sudo sendemail -f agrawals@quicinc.com -t agrawals@quicinc.com -u "BUILDY: $HOSTNAME $PWD done"'

#agrawals shorcuts
#export DIRK="8998" 
alias c='clear'
alias w='cd /home/siagrawal/source/ap6_yocto/'
alias ww='w;cd deps/ap_src'
alias www='ww;cd code/'
alias wwww='www;cd src'
alias ma='www; touch src/*; make ap';
alias mu='www; touch utils/*; make utils';

alias croot='cd /local/mnt/workspace/agrawals/$DIRK/kdev/'

alias a='w;cd kernel/arch/arm/mach-msm' 
alias aa='w;cd kernel/arch/arm/boot/dts/qcom' 
alias b='w;cd bootable/bootloader/lk'
alias o='cd $OUT'
#alias oo='w;cd out/target/product/msm8974/obj/KERNEL_OBJ'
alias oo='cd $OUT/obj/KERNEL_OBJ'
alias ooo='cd $OUT/obj/KERNEL_OBJ/drivers/video/msm/mdss/'
alias qq='cd /local/mnt/workspace/agrawals'
alias q2='cd /local2/mnt/workspace/agrawals/jb_mr1_back;s;lunch msm8974-userdebug'
alias doc='ww;cd Documentation/devicetree/bindings/fb'

alias d='cd /local/mnt2/workspace2/agrawals/'
alias dd='cd /local2/mnt/workspace2/agrawals/'
alias s='source build/envsetup.sh'
#alias ml='m bootimage -j8'
alias ml='~/bin/buildkernel'
alias mll='m -j8 ONE_SHOT_MAKEFILE=build/target/board/Android.mk bootimage'
alias l='echo 'msmcobalt-userdebug';lunch msmcobalt-userdebug;'
alias ll='echo 'msm8996-userdebug';lunch msm8996-userdebug;'
#alias mb='m -j10 out/target/product/msm8974/bootloader'
#alias mb='m -j10 aboot'
alias mb='buildaboot'

# Git Specific shortcuts
alias gs='git status'
alias gb='git branch -v'
alias gd='git diff'
alias gl='git log'
alias gll='git log --oneline'
alias glld='git log --oneline --decorate'
alias gc='git cherry-pick'
alias cc='PW=$PWD;ww; git show HEAD | ./scripts/checkpatch.pl -;cd $PW'
alias ccc='ww;cd drivers/clk/qcom/mdss'
alias ss='git grep -n'
alias ss='grep -rni'
alias gt='git for-each-ref --sort=-committerdate refs/heads/'
alias gp='echo "git push ssh://review-android.quicinc.com:29418/kernel/msm-3.18 HEAD:refs/for/msm-3.18"'
alias gpp='echo "repo init -u git://git.quicinc.com/platform/manifest.git -b "'
alias gln='git log --numstat'
alias ex="ww;scripts/extract-ikconfig ../out/target/product/msm8974/obj/KERNEL_OBJ/vmlinux | grep -rni poison"
alias gg='git show'
alias _strace='echo "python systrace.py gfx input view wm am hal res dalvik sched freq idle load sync"'
alias 'sign=python /local/mnt/workspace/gensecimage/gensecimage.py --stage=qpsa:sign --section=appsbl --config=/local/mnt/workspace/gensecimage/resources/8084/8084_LA_gensecimage.cfg'
alias init=init_repo
alias fll=sync_build
alias xxx=sid_commit

#aravindh 4.4 alias
alias ker="croot;cd kernel/msm-4.4"
alias msm="ker;cd drivers/video/fbdev/msm"
alias pll="ker;cd drivers/clk/msm/mdss"
alias ddt="ker;cd arch/arm64/boot/dts/qcom"

# Misc
alias con='git diff | grep HEAD | wc -l'
alias rau='alias "repo init -u git://git.quicinc.com/platform/manifest.git -b
refs/tags/${tag} -m versioned.xml"'
alias mem='df -lh'

# Typos
alias v='vim'
alias vmi='vim'
alias cim='vim'
alias bim='vim'
alias sss="sed -i 's/^\([^\[]*\[[0-9]\{3\}\] [^\s]\{4\} \s*[0-9]\+\.[0-9]\+:\) \([^:]*:\) \(tracing_mark_write: .*\)/\1 \3/g' "

# Repo Specific shortcuts
alias rr='repo sync .'

# That sound bash makes!
setterm -blength 0
#set bell-style none

# Backspace annoyance
stty sane

#export PS1='[\u@\h\w \e[0;34$(__git_ps1 " (%s)")\e[m]\$ '

# ORIG export PS1='[\u@\h\w$(__git_ps1 " (%s)")]\$ '

# Makes prompt blue 
# export PS1="\e[0;34m\u@\h \w> \e[m"

alias buildvi='./build_linux -asic -j32'
alias visetup='cd /prj/vlsi/vlsi_verify/vi_nazgul/users/agrawals/vi_8998/pmic_lpm_mmss_dsi_cmd_mode_ulps_min_fio_nazgul_v1'
alias makeapps="visetup;cd build/apps_proc0;time buildvi;"
alias makerpm="visetup;cd build/rpm_proc0;time buildvi;"

alias ffind='find . -name'

alias ma=make_ap5_fnc
function make_ap5_fnc()
{
    sh /home/siagrawal/make_yocto.sh "ap5" "$@"
}
alias mp=make_pliny_fnc
function make_pliny_fnc()
{
    sh /home/siagrawal/make_yocto.sh "pliny" "$@"
}
alias m=make_fnc
function make_fnc()
{
    sh /home/siagrawal/make_yocto.sh "$@"
}
alias sssh=sssh_fnc
function sssh_fnc()
{
    sshpass -f <(printf %sn mt85Wood) ssh root@"$@"
}

alias sscp=sscp_fnc
function sscp_fnc()
{
    sshpass -p "mt85Wood" scp "$@" 
}

function sync_build()
{
	echo 'Building target '$1
	repo sync -j8
	source build/envsetup.sh
	lunch $1
	time make -j8 > makeout.txt 2>&1 &
	echo 'Done building '$1

}

function sid_commit()
{
	echo 'Ok lets ssee'
#cd /local/mnt/workspace/agrawals/kdev/kdev 
	glld | cut -d' ' -f1 | less
#	glld |grep -rni commit

}

function init_repo()
{

	echo 'Initializing repo to '$1
	repo init -u git://git.quicinc.com/platform/manifest.git --repo-url git://git.quicinc.com/tools/repo --repo-branch=caf/caf-stable -b $1

}

function haste()
{
	local haste_url="http://qpaste.runq.qualcomm.com"
		a=$(cat)
		curl -X POST -s -d "$a" $haste_url/documents | awk
			    -F '"' '{print "'${haste_url}'/"$4}'
}
#export PATH="/usr2/agrawals/.linuxbrew/bin:$PATH"
#export MANPATH="/usr2/agrawals/.linuxbrew/share/man:$MANPATH"
#export INFOPATH="/usr2/agrawals/.linuxbrew/share/info:$INFOPATH"
#export HOMEBREW_CACHE="/usr2/agrawals/.linuxbrew/cache"

h2d()
{

    echo $@ | awk 'print toupper($0)' |echo "ibase=16; 0x$@"|bc
}
d2h()
{
    echo "obase=16; $@"|bc
}
#SVN related
alias svnhelp="echo 'svn co svn+ssh://omega/opt/svn/'"
#color the svn diff
# color diffs for SVN
function sd () {
	  svn diff ${1+"$@"} | colordiff
}

alias sshadd='eval `ssh-agent` && ssh-add'
#alias ap='sshpass -f <(printf '%s\n' mt85Wood) ssh root@siagrawal-ap'
alias ap='sshpass -f <(printf '%s\n' mt85Wood) ssh root@siagrawal-ap'
#alias pliny="sshpass -f <(printf '%s\n' mt85Wood) ssh root@siagrawal-pliny"
alias pliny='sssh siagrawal-pliny'

alias show='sd -c'

reset
alias push='sh /home/siagrawal/push.sh'
alias mini='sudo minicom -m -c on -w -D /dev/ttyUSB1'
alias sdd='sd -c'
alias ulpreset='cd ~/Downloads/grokit/;./grokit --action=stop;cd -;sudo /scratch/siagrawal/services2.sh kill && sudo /scratch/siagrawal/services2.sh start'
alias p='pwd'
alias sup='svn up '
