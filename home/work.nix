{pkgs, ...}: {
  home.packages = with pkgs; [
    apacheHttpd
    awscli
    caddy
    trino-cli
    unixtools.xxd
    kubectl
    dracut

    docker
    manifest-tool
    skopeo

    cosign
    grype
    syft
    trivy
  ];
}
