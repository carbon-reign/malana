

{
  main_box = { pkgs, config, ... }: {

    environment.systemPackages = [ pkgs.iaito ];
    users.users.aria = { isNormalUser = true; extraGroups = [ "wheel" ]; initialPassword = "aria"; };


    virtualisation.restrictNetwork = true;
    virtualisation.interfaces =
{
  enp1s0 = {
    vlan = 1;
  };
}

      nixpkgs.config.pulseaudio = true;

  services.xserver = {
    enable = true;
    desktopManager = {
      xterm.enable = false;
      xfce.enable = true;
    };
  };
  services.displayManager.defaultSession = "xfce";
services.displayManager.autoLogin.user = "aria";
  };


  network_box = { pkgs, config, ... }: {


    environment.systemPackages = [ pkgs.wireshark ];
    users.users.aria = { isNormalUser = true; extraGroups = [ "wheel" ]; initialPassword = "aria"; };


    virtualisation.restrictNetwork = true;
    virtualisation.interfaces =
{
  enp1s0 = {
    vlan = 1;
  };
}

      nixpkgs.config.pulseaudio = true;

  services.xserver = {
    enable = true;
    desktopManager = {
      xterm.enable = false;
      xfce.enable = true;
    };
  };
  services.displayManager.defaultSession = "xfce";
services.displayManager.autoLogin.user = "aria";
};
}
