{ pkgs }: {
  home.packages = (with pkgs; [
    apacheHttpd
    caddy
    docker
    awscli
    trino-cli
  ]);
}
