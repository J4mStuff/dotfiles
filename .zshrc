ZSH_THEME="robbyrussell"
plugins=(git)
#Defaults
    export EDITOR=nvim
    export PAGER=less

#Aliases
    alias ls='lsd'
    alias n3k_update="sudo pacman -Syu; yay -Syu; flatpak upgrade"

#Inits
    eval "$(starship init zsh)"
    eval "$(zoxide init --cmd cd zsh)"
    eval $(thefuck --alias)

# History
    alias history='fc -fl 1 | less'
    HISTFILE=~/.histfile
    HISTSIZE=10000
    SAVEHIST=10000
    setopt EXTENDED_HISTORY                     # Include more information about when the command was executed, etc
    setopt APPEND_HISTORY                       # Allow multiple terminal sessions to all append to one zsh command history
    setopt HIST_FIND_NO_DUPS                    # When searching history don't display results already cycled through twice
    setopt HIST_EXPIRE_DUPS_FIRST               # When duplicates are entered, get rid of the duplicates first when we hit $HISTSIZE 
    setopt HIST_IGNORE_SPACE                    # Don't enter commands into history if they start with a space
    setopt HIST_VERIFY                          # makes history substitution commands a bit nicer. I don't fully understand
    setopt SHARE_HISTORY                        # Shares history across multiple zsh sessions, in real time
    setopt HIST_IGNORE_DUPS                     # Do not write events to history that are duplicates of the immediately previous event
    setopt INC_APPEND_HISTORY                   # Add commands to history as they are typed, don't wait until shell exit
    setopt HIST_REDUCE_BLANKS                   # Remove extra blanks from each command line being added to history

#Auto-Completion
    #the auto complete dump is a cache file where ZSH stores its auto complete data, for faster load times
    local ZSH_COMPDUMP="$ZSH_CACHE/acdump-${SHORT_HOST}-${ZSH_VERSION}"  #where to store autocomplete data
    autoload -U compinit                                    # Autoload auto completion
    compinit -i -d "${ZSH_COMPDUMP}"                        # Init auto completion; tell where to store autocomplete dump
    zstyle ':completion:*' menu select                      # Have the menu highlight as we cycle through options
    zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'     # Case-insensitive (uppercase from lowercase) completion
    setopt COMPLETE_IN_WORD                                 # Allow completion from within a word/phrase
    setopt ALWAYS_TO_END                                    # When completing from the middle of a word, move cursor to end of word
    setopt MENU_COMPLETE                                    # When using auto-complete, put the first option on the line immediately
    setopt COMPLETE_ALIASES                                 # Turn on completion for aliases as well
    setopt LIST_ROWS_FIRST                                  # Cycle through menus horizontally instead of vertically

#Key binds
    bindkey '^[[1;5C' forward-word                    # [Ctrl-RightArrow] - move forward one word
    bindkey '^[[1;5D' backward-word                   # [Ctrl-LeftArrow] - move backward one word      
    bindkey '^?' backward-delete-char                 # [Backspace] - delete backward
    bindkey "${terminfo[kdch1]}" delete-char          # [Delete] - delete forward
    bindkey '\e[2~' overwrite-mode                    # [Insert] - toggles overwrite mode                  
    bindkey "${terminfo[kpp]}" up-line-or-history     # [PageUp] - Up a line of history
    bindkey "${terminfo[knp]}" down-line-or-history   # [PageDown] - Down a line of history
    bindkey "^[[A" history-search-backward            # start typing + [Up-Arrow] - fuzzy find history forward  
    bindkey "^[[B" history-search-forward             # start typing + [Down-Arrow] - fuzzy find history backward
    bindkey -v
    bindkey '^R' history-incremental-search-backward
    bindkey  "^[[H"   beginning-of-line
    bindkey  "^[[F"   end-of-line
    bindkey  "^[[3~"  delete-char

#Flex
    fastfetch

