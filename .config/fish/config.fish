### ADDING TO THE PATH
# First line removes the path; second line sets it.  Without the first line,
# your path gets massive and fish becomes very slow.
set -e fish_user_paths
set -U fish_user_paths $HOME/.local/bin $HOME/Applications $fish_user_paths $HOME/evergreen_dev/flutter/bin


### EXPORT ###
set fish_greeting                       # Supresses fish's intro message
set TERM "xterm-256color"               # Sets the terminal type
set CHROME_EXECUTABLE "/usr/bin/chromium"               # Chromium Bin

set -xg _JAVA_AWT_WM_NONREPARENTING 1 

### "bat" as manpager
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"

### SET EITHER DEFAULT EMACS MODE OR VI MODE ###
function fish_user_key_bindings
  # fish_default_key_bindings
  fish_vi_key_bindings
end
### END OF VI MODE ###

### AUTOCOMPLETE AND HIGHLIGHT COLORS ###
set fish_color_normal brcyan
set fish_color_autosuggestion '#7d7d7d'
set fish_color_command brcyan
set fish_color_error '#ff6c6b'
set fish_color_param brcyan

### FUNCTIONS ###
# Function for creating a backup file
# ex: backup file.txt
# result: copies file as file.txt.bak
function backup --argument filename
    cp $filename $filename.bak
end

### ARCHIVE EXTRACTION
# usage: ex <file>
function ex --argument filename
    if test -f $filename
        switch $filename
            case '*.tar.bz2'
                tar xjf $filename
            case '*.tar.gz'
                tar xzf $filename
            case '*.bz2'
                bunzip2 $filename
            case '*.rar'
                unrar x $filename
            case '*.gz'
                gunzip $filename
            case '*.tar'
                tar xf $filename
            case '*.tbz2'
                tar xjf $filename
            case '*.tgz'
                tar xzf $filename
            case '*.zip'
                unzip $filename
            case '*.Z'
                uncompress $filename
            case '*.7z'
                7z x $filename
            case '*.deb'
                tar x $filename
            case '*.tar.xz'
                tar xf $filename
            case '*.tar.zst'
                unzstd $filename
            case '*'
                echo $filename cannot be extracted via ex
        end
    else
        echo "'$filename' is not a valid file"
    end
end

### COLORS ###
function colors
    colorscript random
end


### ALIAS' ###
alias vim="nvim"
alias mirrors="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"

#Some Defaults

# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'
# adding flags
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
# ps
alias psa="ps auxf"
alias psmem='ps auxf | sort -nr -k 4'
alias pscpu='ps auxf | sort -nr -k 3'


# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias ls='ls -A --color=auto'
