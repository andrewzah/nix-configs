{pkgs}: {
  home.packages = with pkgs; [
    apacheHttpd
    caddy
    docker
    awscli
    trino-cli

    trivy
    syft
    grype
    cosign

    unixtools.xxd
  ];
}
