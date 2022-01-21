# Color key:
#   #ffffff Background
#   #efefef Current Line
#   #d6d6d6 Selection
#   #4d4d4c Foreground
#   #8e908c Comment
#   #c82829 Red
#   #f5871f Orange
#   #eab700 Yellow
#   #718c00 Green
#   #3e999f Aqua
#   #4271ae Blue
#   #8959a8 Purple


## set status bar
set -g status-style bg=default
setw -g window-status-current-style bg="#efefef"
setw -g window-status-current-style fg="#4271ae"

## highlight active window
setw -g window-style 'bg=#efefef'
setw -g window-active-style 'bg=#ffffff'
setw -g pane-active-border-style ''

## highlight activity in status bar
setw -g window-status-activity-style fg="#3e999f"
setw -g window-status-activity-style bg="#ffffff"

## pane border and colors
set -g pane-active-border-style bg=default
set -g pane-active-border-style fg="#d6d6d6"
set -g pane-border-style bg=default
set -g pane-border-style fg="#d6d6d6"

set -g clock-mode-colour "#4271ae"
set -g clock-mode-style 24

set -g message-style bg="#3e999f"
set -g message-style fg="#000000"

set -g message-command-style bg="#3e999f"
set -g message-command-style fg="#000000"

# message bar or "prompt"
set -g message-style bg="#2d2d2d"
set -g message-style fg="#cc99cc"

set -g mode-style bg="#ffffff"
set -g mode-style fg="#f5871f"

# right side of status bar holds "[host name] (date time)"
set -g status-right-length 100
set -g status-right-style fg=#ffffff
set -g status-right-style bold
set -g status-right '#[fg=#f99157,bg=#f9f9f9] %H:%M |#[fg=#6699cc] %y.%m.%d '

# make background window look like white tab
set-window-option -g window-status-style bg=default
set-window-option -g window-status-style fg=white
set-window-option -g window-status-style none
set-window-option -g window-status-format '#[fg=#f9f9f9,bg=#3F89E4] #W #[default]'

# make foreground window look like bold yellow foreground tab
set-window-option -g window-status-current-style none
set-window-option -g window-status-current-format '#[fg=#f9f9f9,bg=#77A805] #W #[default]'

# active terminal yellow border, non-active white
set -g pane-border-style bg=default
set -g pane-border-style fg="#999999"
set -g pane-active-border-style fg="#f99157"
