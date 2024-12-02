{username, ...}: {
  services.syncthing = {
    enable = true;

    dataDir = "/home/${username}/sync";
    configDir = "/home/${username}/sync/config";
    user = "${username}";
    group = "users";
    overrideFolders = false;
    overrideDevices = false;
    settings = {
      options = {
        urAccepted = -1; # don't submit anon usage data
      };
      devices = {
        "eagle" = {id = "KBKNDRJ-2HCG7A4-OOR7NX6-APK3DUU-KKODEFE-GCFPD5S-SHLRNFJ-OFKIHQX";};
      };
    };
  };
}
