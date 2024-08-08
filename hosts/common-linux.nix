{ pkgs, lib, ... }:
{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking = {
    networkmanager.enable = true;
    enableIPv6 = false;
    dhcpcd.wait = "background";   # don't wait on interfaces to boot
    dhcpcd.extraConfig = "noarp"; # avoid checking if IP is already taken, boot faster

    extraHosts = lib.concatStrings [
      "127.0.0.1 airflow.arpa\n"
      "127.0.0.1 jupyterhub.arpa\n"
      "127.0.0.1 docker-registry.arpa\n"
    ];
  };

  programs.git.enable = true;
  programs.git.config = {
    alias = {
      aliases = "!git config --list | grep 'alias\\.' | sed 's/alias\\.\\([^=]*\\)=\\(.*\\)/\\1\\ \t => \\2/' | sort";
      churn = "!git log --all -M -C --name-only --format='format:' \"$@\" | sort | grep -v '^$' | uniq -c | sort | awk 'BEGIN {print \"count,file\"} {print $1 \",\" $2}'";
      l = "!f() { git log $* | grep '^commit ' | cut -f 2 -d ' '; }; f";
      please = "push --force-with-lease";
      tags = "tag -l";
      overview = "log --all --oneline --no-merges";
      recap = "log --all --pretty=format:'%h %ad %s' --no-merges --author=<zah@andrewzah.com> --date=short";
      st = "status --short --branch";
    };
    color.ui = true;
    commit.gpgsign = true;
    core.editor = "nvim";
    diff.indentHeuristic = "on";
    filter.lfs = {
      clean = "git-lfs clean -- %f";
      smudge = "git-lfs smudge -- %f";
      process = "git-lfs filter-process";
      required = true;
    };
    init = {
      defaultBranch = "master";
    };
    log.date = "relative";
    user = {
      email = "zah@andrewzah.com";
      name = "Andrew Zah";
      signingkey = "D87BD9DCF11BACD6CDB40CB213732FB13E61E0BE";
    };
  };

  services.udev.extraRules = lib.concatStrings [
    # increase polling rate to 1ms for ps5 dualsense
    ''
    ACTION=="bind", SUBSYSTEM=="hid", DRIVER=="sony", KERNEL=="*054C:0CE6*", ATTR{bt_poll_interval}="1"
    ''
  ];

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    wireplumber.enable = true;
    pulse.enable = true;
    jack.enable = false;
  };

  users.users.andrew = {
    isNormalUser = true;
    description = "Andrew Zah";
    extraGroups = [ "docker" "networkmanager" "wheel" ];
    shell = pkgs.zsh;
  };

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  fonts.packages = with pkgs; [
    nanum
    noto-fonts
  ];

  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };
}
