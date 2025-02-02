{ pkgs, ...}: 
let
    defaultAttrs = { fetchFromGitHub = pkgs.fetchFromGitHub; };
in {
    yazirs = import ./yazirs.nix defaultAttrs;
    lazygit = import ./lazygit.nix defaultAttrs;
    starship = import ./starship.nix defaultAttrs;
    ouch = import ./ouch.nix defaultAttrs;
    open-with-cmd = import ./open-with-cmd.nix defaultAttrs;
    glow = import ./glow.nix defaultAttrs;
    eza-preview = import ./eza-preview.nix defaultAttrs;
}
