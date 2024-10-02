### 葛墨林专用zsh配置文件, 别人要大量修改才能使用

ZSH_THEME="ys"

plugins=(zsh-autosuggestions zsh-syntax-highlighting fzf-tab command-not-found extract z sudo spring archlinux vscode)

### 预备插件说明
#hitokoto一言, copypath复制当前绝对路径, copyfile复制文件, catimg终端打印图片, thefuck两次esc修正错误，themes更改zsh主题
#adb用于adb自动补全，git-lfs提供lfs简化命令,web-search:搜索引擎加内容搜索东西
# zsh-navigation-tools 提供了一组工具,如n-aliases,n-cd,n-env,n-kill,n-history等等
#npm,git 提供了npm和git简化命令 , common-aliases提供了常用命令的alias , dirhistory提供alt+方向键在历史目录中快速跳转

### 已装插件说明
# zsh-autosuggestions 历史补全,zsh-completions额外补全 ,Incremental completion on zsh:实时补全
# fzf-tab补全插件: git clone https://github.com/Aloxaf/fzf-tab ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab
# fast-syntax-highlighting语法高亮插件: git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git\${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
# extract快速解压, x 后面加压缩文件名,支持几乎所有压缩文件类型.  sudo插件按两次esc补上sudo. spring 自动补全spring cli命令
# archlinux,vscode都是对应的简化命令, 具体如下
	# paclist列出所有显示安装的包,pacweb加包名直接打开arch官网搜这个包名
	# vsc打开当前目录,vsc dir打开某个目录,vsca dir把目录添加到最后一个活跃的窗口,


#实时补全插件 :  mkdir $ZSH_CUSTOM/plugins/incr &&  curl -fsSL https://mimosa-pudica.net/src/incr-0.2.zsh -o $ZSH_CUSTOM/plugins/incr/incr.zsh 
#echo 'source $ZSH_CUSTOM/plugins/incr/incr.zsh' >> ~/.zshrc



# 开启搜索命令在哪个包里的功能 ,command-not-found插件,要先安装pkgfile,然后sudo pkgfile -u,在plugin添插件最后source
source /usr/share/doc/pkgfile/command-not-found.zsh

# 额外补全
#git clone --depth=1 https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions
source $HOME/.oh-my-zsh/oh-my-zsh.sh

# 打印二次元卡通图片,aur/pokemon-colorscripts-git 
pokemon-colorscripts --no-title -s -r


# 简化命令
## 目录快速跳转
alias ...=../..
alias ....=../../..
alias .....=../../../..
alias ......=../../../../..
alias 1='cd -'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'
alias 9='cd -9'
alias cdroot='cd /'
alias home='cd $HOME'
alias cache='cd $HOME/.cache'
alias cacheyay='cd $HOME/.cache/yay'
alias yaycache='cd $HOME/.cache/yay/'
alias config='cd $HOME/.config'
alias localshare='cd $HOME/.local/share'
alias localstate='cd $HOME/.local/state'
## 快速编辑
alias zshrc='nvim $HOME/.zshrc'
alias bashrc='nvim $HOME/.bashrc'
alias kittyconf='nvim $HOME/.config/kitty/kitty.conf'
alias hyprconf='nvim $HOME/.config/hypr/hyprland.conf'
alias nvimconf='nvim $HOME/.config/nvim/init.lua'
alias pacmanconf='sudo nvim /etc/pacman.conf'
alias localeconf='sudo nvim /etc/locale.gen'
alias systemconf='sudo nvim /etc/systemd/system.conf'
alias journalconf='sudo nvim /etc/systemd/journald.conf'
alias journaldconf='sudo nvim /etc/systemd/journald.conf'
## 快速启动
alias sysinfo='neofetch | lolcat && uname -a | lolcat &&  hostnamectl | lolcat && localectl && timedatectl' #显示系统信息
alias systemctl='sudo systemctl'
alias sysenable='sudo systemctl enable --now'
alias sysdisable='sudo systemctl disable'
alias sysstart='sudo systemctl start'
alias sysrestart='sudo systemctl restart'
alias sysstop='sudo systemctl stop'
alias sysstatus='sudo systemctl status'
alias syskill='sudo systemctl kill'
alias sysreload='sudo systemctl reload'
alias sysreloadall='sudo systemctl daemon-reload'
alias sysanalyze='systemd-analyze'
alias boottime='systemd-analyze'
alias syslistunits='sudo systemctl list-unit-files'
alias sshd='sudo systemctl enable --now sshd'
alias mysqld='sudo systemctl enable --now mysqld'
alias tomcatd='sudo systemctl start tomcat10'
## 垃圾清理
alias journalclean='sudo journalctl --vacuum-size=0M && sudo journalctl --vacuum-time=0s && sudo rm -rf /var/log/*'
alias cacheclean='sudo sync && sudo sysctl -w vm.drop_caches=3 && sudo rm -rf $HOME/.cache/* && history -c'
alias npmclean='sudo yarn cache clean && sudo npm cache clean --force && sudo pnpm store prune'
alias pkgclean='sudo pacman -Scc  --noconfirm && yay -Scc --noconfirm && sudo paccache -rk0 && sudo pacman -Rns $(pacman -Qtdq)'
alias lnclean='sudo find / -type l ! -exec test -e {} \; -delete'
alias fileclean='sudo trash-empty && sudo rm -rf ~/.local/share/recently-used.xbel'
## 其他简化命令
alias h='history'
alias als='alias'
alias vport='export HTTP_PROXY="http://127.0.0.1:7897" && export HTTPS_PROXY="https://127.0.0.1:7897"'
alias _='sudo '
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias gc1='git clone --recursive --depth=1'
alias globurl='noglob urlglobber '
alias grep='grep --color=auto'
alias vim='nvim'
alias tp='sudo trash-put'
alias tpall='sudo trash-put *'
alias te='sudo trash-empty'
alias tr='trash-restore'
alias root='su root'
alias tzgml='su tzgml'
alias grubmk='sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias grubmkconfig='sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias grubupdate='sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias grubconf='sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias updategrub='sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias checkfcitx='fcitx5-diagnose'
alias fcitxcheck='fcitx5-diagnose'
alias kernelversion='/lib/ld-linux-x86-64.so.2 --help'
alias btrfszip='sudo btrfs filesystem defragment -r -v -czstd /'
# alias syu='sudo pacman -Syu --noconfirm'
# alias syyu='sudo pacman -Syyu --noconfirm'
alias disk='sudo fdisk -l && df -h && lsblk'
alias syu='yay -Syu --noconfirm'
alias syyu='yay -Syyu --noconfirm'
alias yyu='yay -Syyu --noconfirm'
alias yuu='yay -Syuu --noconfirm'
alias syyu='yay -Syyu --noconfirm'
alias syuu='yay -Syuu --noconfirm'
alias getmirrors='echo "北外源：
Server = https://mirrors.bfsu.edu.cn/archlinuxcn/$arch
清华源 ： Server = https://mirrors.tuna.tsinghua.edu.cn/archlinuxcn/$arch
中科大源
Server = https://mirrors.ustc.edu.cn/archlinuxcn/$arch
北大源
Server = https://mirrors.pku.edu.cn/archlinuxcn/$arch
腾讯云 
Server = https://mirrors.cloud.tencent.com/archlinuxcn/$arch
阿里云 
Server = https://mirrors.aliyun.com/archlinuxcn/$arch"'
alias dusort='du -sh *|sort -nr'
alias dush='du -sh'
alias chmodall='chmod -R 777 *'
# kitty终端专用
alias catimg='kitten icat'
alias icat='kitten icat'
alias diff='kitten diff'
alias cat='bat'

#包管理器简化
alias pacman='sudo pacman'
alias pacs='sudo pacman -S'
alias pacss='sudo pacman -Ss'
alias pacsyu='sudo pacman -Syu --noconfirm'
alias pacsyyu='sudo pacman -Syyu --noconfirm'
alias pacscc='sudo pacman -Scc'
alias pacu='sudo pacman -U'
alias pacqdt='sudo pacman -Qdt'
alias pacqi='sudo pacman -Qi'
alias pacqs='sudo pacman -Qs'
alias pacq='sudo pacman -Q'
alias pacsi='sudo pacman -Si'
alias pacr='sudo pacman -R'
alias pacrns='sudo pacman -Rns'
alias pacrscn='sudo pacman -Rscn'
alias yays='yay -S'
alias yayss='yay -Ss'
alias yaysyu='yay -Syu --noconfirm'
alias yaysyyu='yay -Syyu --noconfirm'
alias yayscc='yay -Scc'
alias yayu='yay -U'
alias yayqdt='yay -Qdt'
alias yayqi='yay -Qi'
alias yayqs='yay -Qs'
alias yayq='yay -Q'
alias yaysi='yay -Si'
alias yayr='yay -R'
alias yayrns='yay -Rns'
alias yayrscn='yay -Rscn'

# git命令简化
alias g='git'
alias ginit='git init'
alias gi='git init'
alias gs='git status' 
alias gstatus='git status'
alias ga='git add'
alias gadd='git add'
alias gc='git commit -m'
alias gcommit='git commit -m'
alias glog='git log' 
alias gb='git branch'
alias gbranch='git branch'
alias gbm='git branch -m'
alias gbranchm='git branch -m'
alias gbranchd='git branch -d'
alias gbranchD='git branch -D'
alias gck='git checkout'
alias gcheckout='git checkout'
alias gcheckoutb='git checkout -b'
alias gam='git commit -am'
alias gcam='git commit -am'
alias gcommitam='git commit -am'
alias gm='git merge'
alias gmerge='git merge'
alias clone='git clone'
alias gclone='git clone'
alias gr='git remote'
alias grv='git remote -v'
alias gra='git remote add'
alias gurl='git remote set-url'
alias gp='git push'
alias gpf='git push -f'
alias gpush='git push'
alias gpush='git push -f'
alias gf='git fetch'
alias gd='git diff'
alias gpl='git pull'
alias gl='git pull'
alias gpull='git pull'

# mysql命令简化
alias rootsql='mysql -u root -p'
alias mysql='mysql -u tzgml -p'
alias sqlinit='sudo mysqld --initialize --user=mysql --basedir=/usr --datadir=/var/lib/mysql'
alias sqlsecure='cmysql_secure_installation'


# 比ls和cat更好的替代品
if [[ $(command -v exa) ]] {
	DISABLE_LS_COLORS=true
	unset LS_BIN_FILE
	for i (/bin/ls ${PREFIX}/bin/ls /usr/bin/ls /usr/local/bin/ls) {
		[[ ! -x ${i} ]] || {
			local LS_BIN_FILE=${i}
					break
				}
			}
			[[ -n ${LS_BIN_FILE} ]] || local LS_BIN_FILE=$(whereis ls 2>/dev/null | awk '{print $2}')
			alias lls=${LS_BIN_FILE} 
			# lls is the original ls. lls为原版ls
			alias ls="exa --color=auto --icons" 
			# Exa is a modern version of ls. exa是一款优秀的ls替代品,拥有更好的文件展示体验,输出结果更快,使用rust编写。
			alias l='exa -lbah --icons'
			alias la='exa -labgh --icons'
			alias ll='exa -lbg --icons'
			alias lsa='exa -lbagR --icons'
			alias lst='exa -lTabgh --icons' # 输入lst,将展示类似于tree的树状列表。
		} else {
		alias ls='ls --color=auto'
		alias lst='tree -pCsh'
		alias l='ls -lah'
		alias la='ls -lAh'
		alias ll='ls -lh'
		alias lsa='ls -lah'
	}

	set_bat_paper_variable() {
		unset CAT_BIN_FILE i
		for i (/bin/cat ${PREFIX}/bin/cat /usr/bin/cat /usr/local/bin/cat) {
			[[ ! -x ${i} ]] || {
				local CAT_BIN_FILE=${i}
							unset i
							break
						}
					}
					[[ -n ${CAT_BIN_FILE} ]] || local CAT_BIN_FILE=$(whereis cat 2>/dev/null | awk '{print $2}')
					alias lcat=${CAT_BIN_FILE} 
					# lcat is the original cat.
					typeset -g BAT_PAGER="less -m -RFQ" # 输q退出bat的页面视图
				}
				# bat是cat的替代品，支持多语言语法高亮。
				for i (batcat bat) {
					if [[ $(command -v ${i}) ]] {
						alias cat="${i} -pp"
						set_bat_paper_variable
						break
					}
				}


## 兼容dos命令
alias md='mkdir -p'
alias rd='rmdir'
alias cls='clear'
alias dir='ls'
alias copy='cp'
alias move='mv' #移动
alias ren='mv'  #改名
alias del='rm -i'
alias taskkill='kill'
alias ipconfig='ifconfig'
alias netsh='ifconfig' #设置网络，如ip,dns
alias tasklist='top' #查看进程列表
alias sh='start' #启动可执行文件
alias net='sudo systemctl' #服务控制
alias wintype='cat' #win下的type命令
alias shutdown='poweroff' # 关机
alias chkdsk='sudo fdisk -l && df -h && lsblk'  #查看磁盘状态
alias format='mkfs' #格式化设备
alias xcopy='cp -r' #连带着子目录复制
alias attrib='chattr'  #+i 让文件怎么都不会被修改或删除，取消则-i
alias defrag='e4defrag' #磁盘碎片整理
alias subst='ln -s' #win下是将一个磁盘映射到另一个磁盘的某个目录访问
alias doskey='alias'  #win下doskey还可以重写命令，编辑历史命令列表
alias winfc='diff'  #win下的fc,比较文件不同
alias comp='diff'  #win下交互式比较文件
alias systeminfo='neofetch | lolcat && uname -a | lolcat &&  hostnamectl | lolcat' #显示系统信息
alias notepad='nvim' #win下记事本
alias icacls='chmod' #win下可以更改权限和所有者
alias perfmon='glances' #系统性能监视工具，可以替换成其他工具
alias clip='wl-copy' #把命令输出重定向到剪贴板，x11下是xclip
#alias dos='bash' #bash比喻为dos,zsh比喻为powershell
#alias powershell='zsh'

# 兼容mac命令
alias brew='apt'
alias open='sh' #mac用来打开软件
alias xlock='hyprlock -q' # x11下是xlock,但我是hyprland


## 文件安全配置
alias rm='rm -i'
function rm() {
	if [ "$#" -eq 0 ]; then
		command rm -i
	else
		local args=()
		for arg in "$@"; do
			case "$arg" in
				-r) args+=(-ir) ;;
				-rf) args+=(-ir) ;;
				-f) args+=(-i) ;;
				*) args+=("$arg") ;;
			esac
		done
		command rm "${args[@]}"
	fi
}
# 嫌麻烦直接用Trash-put,然后Trash-empty



## 历史记录
export HISTORY_IGNORE="(ls|cd|pwd|exit|sudo reboot|history|cd -|cd ..)"
HISTSIZE=5000
SAVEHIST=6000
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

## zsh选项
setopt AUTOCD              # 只输入目录名就可以跳转
setopt PROMPT_SUBST        # 允许提示词命令替换
setopt MENU_COMPLETE       # 自动高亮第一个元素的补全按钮
setopt LIST_PACKED	   # 补全菜单更少的占用空间
setopt AUTO_LIST           # 自动列出模棱两可的补全
setopt COMPLETE_IN_WORD    # 从单词两端补全


# command not found
#command_not_found_handler() {
#	printf "%s%s? 宝宝不要再说胡话了\n" "$acc" "$0" >&2
 #   return 127
#}

## 欢迎语
fastfetch --logo Blackarch  | lolcat
figlet -f big "        TZGML" | lolcat

# 伪一言
echo "    每日一言 | Hitokoto 驱动: \n     不自由，毋宁死！ ———— 帕特里克·亨利 于(1775)  " | lolcat

# 一言
#curl https://v1.hitokoto.cn/ &>.Yi.txt
# echo -e "\n \e[32m$(cat .Yi.txt|grep hitokoto |awk -F: '{print $4}'| awk -F, '{print $1}')"" \e[0m" | lolcat


