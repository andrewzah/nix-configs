{pkgs, ...}: {
  home.packages = with pkgs; [
    apacheHttpd
    awscli
    caddy
    cosign
    docker
    grype
    jetbrains.webstorm
    skopeo
    syft
    trino-cli
    trivy
    unixtools.xxd
  ];
}
