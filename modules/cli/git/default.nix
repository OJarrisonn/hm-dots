{...}: {
    programs.git = {
        enable = true;
        delta.enable = true;
        delta.options = {
            navigate = true;
            light = false;
            features = "catppuccin-mocha";
            line-numbers = true;
        };
        extraConfig = {
            diff. colorMoved = "default";
            merge.conflictStyle = "diff3";
        };
        userEmail = "j.h.m.t.v.10@gmail.com";
        userName = "OJarrisonn";
        #includes = [ "~/.config/catppuccin.gitconfig" ];
    };

    programs.lazygit = {
        enable = true;
        settings = {
            git = {
                commit.signOff = true;
                paging = {
                    colorArg = "always";
                    pager = "delta --dark --paging=never";
                    #externalDiffCommand: difft --color=always
                };
            };

            gui = {
                nerdFontsVersion= "3";
            };
        };
    };

    programs.gh.enable = true;
}
