

{
  infected_box = { pkgs, config, ... }: {

  virtualisation.diskImage = "/home/wendigo/malana/infected.qcow2";

    environment.systemPackages = [ pkgs.iaito pkgs.nmap pkgs.neofetch pkgs.firefox ];
    users.users.infected = { isNormalUser = true; extraGroups = [ "wheel" ]; initialPassword = "pass"; };


networking.enableIPv6 = false;
virtualisation.restrictNetwork = true;
networking.firewall.enable = false;

networking.networkmanager.enable = true;
networking.defaultGateway.address = "192.168.1.2";
networking.nameservers = [
  "192.168.1.2"
];
networking.networkmanager.unmanaged = [ "eth0"  ];
networking.interfaces = {};


      nixpkgs.config.pulseaudio = true;

  services.xserver = {
    enable = true;
    desktopManager = {
      xterm.enable = false;
      xfce.enable = true;
    };
  };
  services.displayManager.defaultSession = "xfce";
services.displayManager.autoLogin.user = "infected";
  };


  network_box = { pkgs, config, ... }: {

  virtualisation.diskImage = "/home/wendigo/malana/network.qcow2";


environment.systemPackages = with pkgs; [
  wireshark
  nmap
  (perl.withPackages (p: [
    p.IPCShareable
    p.IOSocketSSL
    p.DigestSHA3
    p.NetDNS
    p.NetServer
  ]))
  cmake

  swig
  libnetfilter_queue
  gnumake
  gcc
  pkg-config-unwrapped
  libnfnetlink
];

    users.users.network = { isNormalUser = true; extraGroups = [ "wheel" ]; initialPassword = "pass"; };
networking.networkmanager.enable = true;


programs.bash.enable = true;

networking.defaultGateway.address = "192.168.1.2";
networking.nameservers = [
  "192.168.1.2"
];

    networking.enableIPv6 = false;
virtualisation.restrictNetwork = true;
networking.firewall.enable = false;

networking.networkmanager.unmanaged = [ "eth0" ];
networking.interfaces = {};

      nixpkgs.config.pulseaudio = true;

  services.xserver = {
    enable = true;
    desktopManager = {
      xterm.enable = false;
      xfce.enable = true;
    };
  };
  services.displayManager.defaultSession = "xfce";
services.displayManager.autoLogin.user = "network";
};
}
