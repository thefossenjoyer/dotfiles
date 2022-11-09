{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "thefossenjoyer";
  home.homeDirectory = "/home/thefossenjoyer";

  # programs.moc = {
  #   enable = true;
  # };

  # enable configuring fonts
  fonts.fontconfig.enable = true;

  nixpkgs.config.allowUnfree = true;
  
  home.packages = with pkgs; [

    moc # a terminal audio player
    emacs # the best text editor!

    # utils
    roswell
    sbcl
    dmenu

    # theming
    nitrogen
    lxappearance

    gruvbox-dark-gtk
    gruvbox-dark-icons-gtk
    
    # fonts ; DON'T FORGET TO RUN fc-cache -fv
    iosevka
    cascadia-code
    mononoki
    fira-code
    source-code-pro
    jetbrains-mono
    # hack-font
    hasklig

    # sound
    pavucontrol

    # chatting
    hexchat # a GUI IRC chatting app
    tdesktop # telegram
    # dino # jabber
    
    # programming
    # rustup

    # rust
    rustc
    cargo
    rls
    rust-analyzer

    # c/c++
    gcc

    # hs
    ghc
    # haskellPackages.ghcup - BROKEN!
    haskell-language-server

    # clojure
    clojure
    leiningen
    clojure-lsp

    # gaming
    # wine
    wineWowPackages.stable
    lutris
    steam

    mpv

    # nixos stuff
    git
    git-crypt
    gnupg

    
  ];

  # shell
  programs.zsh = {
    enable = true;
    shellAliases = {
      hms = "home-manager switch";
    };

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "zsh-syntax-highlighting" "zsh-autosuggestions" ];
      theme = "half-life";
    };
    
  };

  # fish - the friendly interactive shell
  programs.fish = {
    enable = true;
    interactiveShellInit = "
      set fish_greeting
      source ~/dotfiles/fish_conf/prompt.fish
      source ~/dotfiles/fish_conf/aliases.fish
      ";
  };

  # programs.moc.enable = true;
  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
