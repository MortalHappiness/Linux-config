function fish_mode_prompt --description "Displays the current mode"
    switch $fish_bind_mode
        case default
            set_color --bold --background red white
            echo '[N]'
        case insert
            set_color --bold --background green white
            echo '[I]'
        case replace_one
            set_color --bold --background green white
            echo '[R]'
        case replace
            set_color --bold --background cyan white
            echo '[R]'
        case visual
            set_color --bold --background magenta white
            echo '[V]'
    end
    set_color normal
    echo -n ' '
end
