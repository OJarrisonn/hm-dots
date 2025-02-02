{pkgs, ...}: {
    imports = [
        ./yazi
    ];
    programs.bat = {
        enable = true;
        extraPackages = with pkgs.bat-extras; [
            batdiff
            batgrep
            batman
            batpipe
            batwatch
            prettybat
        ];
        config.style = "numbers,changes,grid";
        syntaxes = {
            nushell = {
                src = pkgs.fetchFromGitHub {
                    owner = "stevenxxiu";
                    repo = "sublime_text_nushell";
                    rev = "66b00ff639dc8cecb688a0e1d81d13613b772f66";
                    sha256 = "sha256-paayZP6P+tzGnla7k+HrF+dcTKUyU806MTtUeurhvdg=";
                };
                file = "nushell.sublime-syntax";
            };
        };
    };

}
