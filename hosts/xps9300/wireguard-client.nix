{...}: {
  #networking.nat = {
  #  enable = true;
  #  externalInterface = "wlp0s20f3";
  #  internalInterfaces = [ "wg0" ];
  #};
  networking.firewall.allowedUDPPorts = [51820];

  #networking.wg-quick.interfaces.wg0 = {
  #  #ips = [];
  #  #listenPort = 51820;
  #  privateKeyFile = "/home/andrew/.wireguard/private";
  #  address = [ "175.193.252.129" ];

  #  peers = [
  #    {
  #      publicKey = "s0MlNFBwlud915xEu8zNznzRiDsiI0yGO5USPTZ20HA=";
  #      allowedIPs = [ "0.0.0.0/0" ];
  #      endpoint = "175.193.252.129:51280";
  #      persistentKeepalive = 25;
  #    }
  #  ];
  #};
}
