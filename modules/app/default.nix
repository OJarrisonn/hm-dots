{config, pkgs, ...}: {
   programs.ghostty = {
        enable = true;
        package = (config.lib.nixGL.wrap pkgs.ghostty);
        installBatSyntax = true;
        settings = {
            window-padding-y = "4,8";
            window-padding-x = "8";
            bold-is-bright = true;

            font-family = "Fira Code Nerd Font Ret";
            font-family-bold = "Fira Code Nerd Font Bold";
            font-family-italic = "Fira Code Nerd Font Italic";
            font-family-bold-italic = "Fira Code Nerd Font Bold Italic";

            keybind = [
                "ctrl+shift+up=goto_split:top"
                "ctrl+shift+k=goto_split:top"
                "ctrl+shift+down=goto_split:bottom"
                "ctrl+shift+j=goto_split:bottom"
                "ctrl+shift+left=goto_split:left"
                "ctrl+shift+h=goto_split:left"
                "ctrl+shift+right=goto_split:right"
                "ctrl+shift+l=goto_split:right"

                "ctrl+alt+left=previous_tab"
                "ctrl+alt+right=next_tab"
                "ctrl+shift+alt+left=move_tab:-1"
                "ctrl+shift+alt+right=move_tab:+1"

                "ctrl+w=close_surface"
            ];
        };
    }; 
}
