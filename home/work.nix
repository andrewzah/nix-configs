{pkgs, ...}: {
  home.packages = with pkgs; [
    alejandra

    apacheHttpd
    awscli
    caddy
    gh
    trino-cli
    unixtools.xxd

    docker
    manifest-tool
    skopeo

    cosign
    grype
    syft
    trivy
  ];
}
