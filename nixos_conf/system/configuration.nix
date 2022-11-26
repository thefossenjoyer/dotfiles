# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      #<home-manager/nixos>
    ];

  # nix flakes
  nix.package = pkgs.nixFlakes;
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';
  
  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  # boot.loader.grub.efiSupport = true;
  # boot.loader.grub.efiInstallAsRemovable = true;
  # boot.loader.efi.efiSysMountPoint = "/boot/efi";
  # Define on which hard drive you want to install Grub.
  boot.loader.grub.device = "/dev/sda"; # or "nodev" for efi only
  boot.supportedFilesystems = [ "ntfs" ];

  networking = {
    hostName = "kittycat";
    networkmanager.enable = false;
    wireless.enable = true;
    useDHCP = false;
    # interfaces.wlp10s0f3u3.useDHCP = true;
    #useNetworkd = true;
    # dhcpcd.extraConfig = ''
    #   interface wlp10s0f3u3
    #   static domain_name_servers=1.1.1.1
    # '';
    nameservers = [ "1.1.1.1" ];
  };

  # environment.etc = {
  #   "resolv.conf".text = "nameserver 1.1.1.1\n";
  # };

  
  # networking.hostName = "kittycat"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  # networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.
  # networking.networkmanager.dns = "none;"

  # Set your time zone.
  time.timeZone = "Europe/Belgrade";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    #keyMap = "us";
    useXkbConfig = true; # use xkbOptions in tty.
  };

  
  nixpkgs.config.allowUnfree = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.opengl.enable = true;
  hardware.opengl.extraPackages32 = with pkgs.pkgsi686Linux; [ libva ];
  hardware.opengl.setLdLibraryPath = true;
  hardware.opengl.driSupport32Bit = true;

  hardware.enableRedistributableFirmware = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;


  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  
  services.xserver.windowManager = {
    bspwm.enable = true;
    stumpwm.enable = true;
  };

  # stop the system from autosleep
  # systemd.targets.sleep.enable = false;
  # systemd.targets.suspend.enable = false;
  # systemd.targets.hibernate.enable = false;
  # systemd.targets.hybrid-sleep.enable = false;

  # Configure keymap in X11
  services.xserver.layout = "us";
  # services.xserver.xkbOptions = {
  #   "eurosign:e";
  #   "caps:escape" # map caps to escape.
  # };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.thefossenjoyer = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      firefox
      thunderbird
     ];
  };

  # FONTS!
  fonts.fonts = with pkgs; [
    cascadia-code
    iosevka
  ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
     vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
     wget
     
     nitrogen
     picom
     sxhkd
     emacs
     roswell
     git
     neofetch
     
     # wm stuff     
     alacritty
     flameshot
     pcmanfm
     dmenu
     # apps
     element-desktop

     gimp
     
     # theme
     lxappearance

     libGL
  ];

  programs.gnupg.agent.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.05"; # Did you read the comment?

}

