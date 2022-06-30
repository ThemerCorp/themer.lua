{
  description = "Dev Shell For Meteroite";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-22.05";
    flake-utils.url = "github:numtide/flake-utils/master";
    devshell.url = "github:numtide/devshell/master";
    nvim-nightly.url = "github:nix-community/neovim-nightly-overlay";
  };
  outputs = { self, nixpkgs, flake-utils, nvim-nightly, devshell }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [ devshell.overlay nvim-nightly.overlay ];
        };

      in {
        devShell = pkgs.devshell.mkShell {
          name = "meteorite-dev-shell";
          packages = with pkgs; [ neovim-nightly stylua selene sumneko-lua-language-server alejandra rnix-lsp ];
        };
      });
}
