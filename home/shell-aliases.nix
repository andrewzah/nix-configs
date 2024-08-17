{}:
{
  aliases = {
    j = "just";
    k = "kubectl";
    ll = "lsd -la --icon never";
    v = "nvim";

    dc = "docker compose";
    deit = "docker exec -it";
    dil = "docker image ls";
    dk = "docker kill";
    dlr = "docker load < ./result";
    dps = "docker ps";
    drri = "docker run --rm -it";
    drrie = "docker run --rm -it --entrypoint='/bin/sh'";
    drrieb = "docker run --rm -it --entrypoint='/bin/bash'";
    drrieu = "docker run --rm -it --entrypoint='/usr/bin/env bash'";

    gpod = "git push origin dev";
    gpodr = "git pull origin dev --rebase";
    gpom = "git push origin master";
    gpomr = "git pull origin master --rebase";

    nib = "nix-build";
    ns = "nix-shell";
    nd = "nix develop";
    nf = "nix flake";
    nr = "nix run";

    ta = "tmux attach";
    tat = "tmux attach -t";
  };
}
