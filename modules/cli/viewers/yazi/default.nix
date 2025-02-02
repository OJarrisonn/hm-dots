{lib, pkgs, ...}: 
let
    plugins = import ./plugins { inherit lib pkgs; };
in {
    programs.yazi = {
        enable = true;
        enableBashIntegration = true;
        enableNushellIntegration = true;
        initLua = ./init.lua;
        keymap = {
            manager.prepend_keymap = [
                { on = ["<PageUp>"]; run = "seek -1"; desc = "Scroll up preview window"; }
                { on = ["<PageDown>"]; run = "seek 1"; desc = "Scroll down preview window"; }

                { on = ["<C-s>"]; run = "shell \"$SHELL\" --block --confirm"; desc = "Open shell here"; }

                { on = ["<Esc>"]; run = "close"; desc = "Cancel input"; }

                { on = ["l"]; run = "plugin smart-enter"; desc = "Enter the child directory, or open the file"; }

                { on = ["c" "m"]; run = "plugin chmod"; desc = "Chmod on selected files"; }

                { on = "o"; run = "plugin open-with-cmd --args=block"; desc = "Open with command in the terminal"; }

                { on = "O"; run = "plugin open-with-cmd"; desc = "Open with command"; }

                { on = ["e" "s"]; run = "shell \"code $@\" --confirm"; desc = "Open with VSCode"; }

                { on = ["e" "h"]; run = "shell 'code .' --confirm"; desc = "Open current folder in VSCode"; }

                { on = ["g" "l"]; run = "plugin lazygit"; desc = "Open lazygit"; }

                { on = ["E"]; run = "plugin eza-preview"; desc = "Toggle tree/list dir preview"; }

                { on = ["-"]; run = "plugin eza-preview --args='--inc-level'"; desc = "Increment tree level"; }

                { on = ["_"]; run = "plugin eza-preview --args='--dec-level'"; desc = "Decrement tree level"; }

                { on = ["$"]; run = "plugin eza-preview --args='--toggle-follow-symlinks'"; desc = "Toggle tree follow symlinks"; }
            ];
        };
        settings = {
            manager = {
                sort_sensitive = false;
                sort_dir_first = true;
            };

            plugin = {
                prepend_previewers = [
                    # Glow
                    { name = "*.md"; run = "glow"; }
                    # EZA
                    { name = "*/"; run = "eza-preview"; }
                    # Archive previewer
                    { mime = "application/*zip"; run = "ouch"; }
                    { mime = "application/x-tar"; run = "ouch"; }
                    { mime = "application/x-bzip2"; run = "ouch"; }
                    { mime = "application/x-7z-compressed"; run = "ouch"; }
                    { mime = "application/x-rar"; run = "ouch"; }
                    { mime = "application/x-xz"; run = "ouch"; }
                ];
                prepend_fetchers = [
                    {id = "git"; name = "*"; run = "git"; }
                    {id = "git"; name = "*/"; run = "git"; }
                ];
            };
        };
        plugins = with plugins; {
            # In-house plugins
            git =           yazirs + "/git.yazi";
            full-border =   yazirs + "/full-border.yazi";
            chmod =         yazirs + "/chmod.yazi";

            inherit lazygit
                    starship
                    glow
                    ouch
                    open-with-cmd
                    eza-preview;
        };
    };
}
