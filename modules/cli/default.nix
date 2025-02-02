{...}: {
  imports = [
    ./git
    ./viewers
  ];

  programs.ripgrep = {
    enable = true;
    arguments = [];
  };

  programs.fzf = {
    enable = true;
    changeDirWidgetCommand = "fd --type d --hidden";
    defaultCommand = "fd --strip-cwd-prefix --hidden --follow --exclude .git --ignore-file ${./fzf/.fzfignore}";
    defaultOptions = [
      "--layout=reverse"
      "--border=rounded"
      "--height=60%"
      "--padding=2%"
      "--preview=\"rsp {}\""
      "--bind=shift-up:preview-up,shift-down:preview-down,shift-right:preview-bottom,shift-left:preview-top,alt-w:toggle-preview-wrap"
    ];
  };
}
