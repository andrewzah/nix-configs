{pkgs, ...}: {
  networking.extraHosts = pkgs.lib.concatStringsSep "\n" [
    "127.0.0.1 airflow.arpa"
    "127.0.0.1 elasticsearch"
    "127.0.0.1 gitea.arpa"
    "127.0.0.1 grafana.arpa"
    "127.0.0.1 keycloak.arpa"
    "127.0.0.1 labelstudio.arpa"
    "127.0.0.1 nginx.arpa"
    "127.0.0.1 op-test.arpa"
    "127.0.0.1 pulp.arpa"
    "127.0.0.1 superset.arpa"

    "127.0.0.1 dependencytrack.arpa"
    "127.0.0.1 api.dependencytrack.arpa"

    "127.0.0.1 rekor.sigstore.arpa"
    "127.0.0.1 registry.sigstore.arpa"

    "127.0.0.1 amundsen.arpa"
    "127.0.0.1 metadata.amundsen.arpa"
    "127.0.0.1 search.amundsen.arpa"

    "127.0.0.1 ui.registry.apicurio.arpa"
    "127.0.0.1 api.registry.apicurio.arpa"

    "127.0.0.1 openmetadata.arpa"
    "127.0.0.1 ingestion.openmetadata.arpa"
  ];
}
