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
    set theme_color_scheme nord
end
