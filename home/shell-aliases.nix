{}: {
  aliases = {
    k = "kubectl";

    cst = "cd ~/sync/thoughts";
    cz = "cd ~/programming/game/src/ZGame";

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

    nb = "nix build";
    nob = "nom build";
    ns = "nix-shell";
    nd = "nix develop";
    nod = "nom develop";
    nf = "nix flake";
    nr = "nix run";

    ta = "tmux attach";
    tat = "tmux attach -t";

    # philips TAH7508 bluetooth headphones
    bcp = "bluetoothctl connect 00:1E:7C:C9:39:6C";
    bdp = "bluetoothctl disconnect 00:1E:7C:C9:39:6C";
  };
}
