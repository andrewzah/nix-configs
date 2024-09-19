{pkgs, ...}: {
  home.packages = with pkgs; [
    apacheHttpd
    awscli
    caddy
    cosign
    docker
    grype
    skopeo
    syft
    trino-cli
    trivy
    unixtools.xxd

    #TODO: wrapping
    #jetbrains.webstorm
  ];
}
