{ config, lib, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    <home-manager/nixos>
  ];

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";

  networking.networkmanager.enable = true;
  time.timeZone = "America/New_York";

  # Hyprland
  programs.hyprland.enable = true;
  programs.hyprland.withUWSM = true;

  # Polkit (needed for authentication popups)
  security.polkit.enable = true;

  users.users.user = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "video" ];
    packages = with pkgs; [
      fastfetch
    ];
  };

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd 'uwsm start hyprland-uwsm.desktop'";
        user = "user";
      };
    };
  };

  programs.firefox.enable = true;

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
        "discord"
      ];
      permittedInsecurePackages = [
        "pnpm-10.29.2"
      ];
    };
  };

  services.resolved.enable = true;

  services.mullvad-vpn = {
    enable = true;
    package = pkgs.mullvad-vpn;
  };  

  environment.systemPackages = with pkgs; [
    vim
    wget
    nemo
    kitty
    nwg-look
    quickshell
    grim
    slurp
    swappy
    hyprshot
    wl-clipboard
    mako
    dconf
    jq
    socat
    hyprpaper
    networkmanagerapplet
    polkit_gnome
    uwsm
    htop
    lshw
    hackneyed
    qbittorrent
    vlc
    zip
    ncspot
    signal-desktop
    ffmpeg
    dvdauthor
    cdrkit
    dvdplusrwtools
    gimp
    libnotify
    git
    discord
  ];

  # Home Manager
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.user = import ./home.nix;
  home-manager.backupFileExtension = "bak";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "26.05";
}
