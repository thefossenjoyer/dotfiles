{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "thefossenjoyer";
  home.homeDirectory = "/home/thefossenjoyer";
  
  # enable configuring fonts
  fonts.fontconfig.enable = true;

  # allow proprietary software (mostly gaming software)
  nixpkgs.config.allowUnfree = true;
  
  home.packages = with pkgs; [

    qbittorrent
    
    moc # a terminal audio player
    emacs # the best text editor!

    # utils
    roswell
    sbcl
    dmenu

    # theming
    nitrogen
    lxappearance
    feh

    gruvbox-dark-gtk
    gruvbox-dark-icons-gtk

    dracula-theme
    nordic
    arc-theme
    
    
    # fonts ; DON'T FORGET TO RUN fc-cache -fv
    iosevka
    cascadia-code
    mononoki
    fira-code
    source-code-pro
    jetbrains-mono
    # hack-font
    hasklig
    meslo-lg
    # fantasque-sans-mono
    # borg-sans-mono
    terminus_font_ttf
    roboto-mono

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
    clang-tools
    valgrind
    czmq

    cmake
    gnumake

    # libs
    libtool

    # hs
    ghc
    # haskellPackages.ghcup - BROKEN!
    haskell-language-server

    

    # gaming
    # wine
    # wineWowPackages.stable
    winePackages.base
    lutris
    steam
    steam-run
    bottles
    libGL

    mpv

    # nixos stuff
    git
    git-crypt
    gnupg
    pinentry

    nix-index

    # notifs
    notify-desktop
    dunst

    killall # killall command

    pfetch # less bloated neofetch

    # elixir
    elixir
    erlang
    elixir_ls

    # julia
    julia-bin
    julia-mono # a necessary font

    jupyter

    # go
    go
    gopls

    starship

    # window manager stuff
    picom
    # stumpwm
    ranger
    qutebrowser
    nyxt
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
      # source ~/dotfiles/fish_conf/prompt_starship.fish
      source ~/dotfiles/fish_conf/prompt.fish
      # source ~/dotfiles/fish_conf/custom_prompt.fish
      source ~/dotfiles/fish_conf/aliases.fish
      source ~/dotfiles/fish_conf/env_vars.fish
      ";
  };

  programs.starship = {
    enable = false;

    settings = {
      # add_newline = false;

      character = {
        success_symbol = "[λ](green)";
        error_symbol = "[➜](bold red)";
      };

      # package.disabled = true;

      username = {
        style_user = "purple";
        style_root = "red bold";
        format = "[$user]($style) ";
        disabled = false;
        show_always = true;
      };

      hostname = {
        ssh_only = false;
        format = "on [$hostname](bold yellow) ";
        trim_at = ".";
        disabled = false;
      };

      directory = {
        read_only = " ";
        truncation_length = 10;
        truncate_to_repo = true; # truncates directory to root folder if in github repo
        style = "bold italic blue";
      };
      
    };
    
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
  # home.stateVersion = "20.09";
  
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
