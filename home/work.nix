{pkgs, ...}: {
  home.packages = with pkgs; [
    apacheHttpd
    awscli
    caddy
    cosign
    docker
    gh
    grype
    skopeo
    syft
    trino-cli
    trivy
    unixtools.xxd
    alejandra

    #TODO: wrapping
    #jetbrains.webstorm
  ];
}
