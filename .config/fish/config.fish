if status is-interactive
    # Commands to run in interactive sessions can go here
    fish_vi_key_bindings

    # enable to select complemensions with hjkl on insert mode
    bind -M insert k "if commandline -P; commandline -f up-line; else; commandline -i k; end"
    bind -M insert j "if commandline -P; commandline -f down-line; else; commandline -i j; end"
    bind -M insert h "if commandline -P; commandline -f backward-char; else; commandline -i h; end"
    bind -M insert l "if commandline -P; commandline -f forward-char; else; commandline -i l; end"

    # change cursor shape in vi mode
    set fish_cursor_default block
    set fish_cursor_insert line
    set fish_cursor_replace_one underscore
    set fish_cursor_visual block

    # select bobthefish color scheme
    set theme_color_scheme catppuccin-frappe

    # enable nerd font support in bobthefish
    set -g theme_nerd_fonts yes

    abbr --add dmemo nvim '~/Documents/daily_memo/'(date '+%Y-%m-%d')'.md'

    # pyenv
    set -Ux PYENV_ROOT $HOME/.pyenv
    fish_add_path $PYENV_ROOT/bin
    pyenv init - | source

    # direnv
    set -x EDITOR nvim
    eval (direnv hook fish)

    # rbenv
    set -Ux RBENV_ROOT $HOME/.rbenv
    set -U fish_user_paths $RBENV_ROOT/bin $fish_user_paths
    status is-interactive; and source (rbenv init -|psub)
end
