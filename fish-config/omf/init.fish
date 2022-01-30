set -xg EDITOR vim
umask 022

set fish_greeting

set -l gray 75715E
set -l red FF0000
set -l pink FF005F
set -l orange FF8700
set -l yellow D7D75F
set -l green 87D700
set -l blue 5FD7FF
set -l purple AF87FF

set -g fish_color_normal normal
set -g fish_color_command $blue
set -g fish_color_keyword $pink
set -g fish_color_quote $yellow
set -g fish_color_redirection $purple
set -g fish_color_end normal
set -g fish_color_error $red
set -g fish_color_param normal
set -g fish_color_comment $gray
set -g fish_color_selection white --bold --background=brblack
set -g fish_color_operator $pink
set -g fish_color_escape $yellow
set -g fish_color_autosuggestion $gray
set -g fish_color_search_match while --bold --background=brblack
