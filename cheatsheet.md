cribbed from https://github.com/NotAShelf/nyx/blob/main/docs/cheatsheet.md

# Cheat sheet

## Show GC roots

```sh
nix-store --gc --print-roots | grep -v "<hostName>" | column -t | sort -k3 -k1
```

## List all packages

```sh
nix-store -q --requisites /run/current-system | cut -d- -f2- | sort | uniq

# wc -l isn't accurate as the same package can be repeated with different versions
```

## Find biggest packages

```sh
nix path-info -hsr /run/current-system/ | sort -hrk2 | head -n 30
```

## Find biggest closures (packages including dependencies)

```sh
nix path-info -hSr /run/current-system/ | sort -hrk2 | head -n 10
```

## Show package dependencies as tree

> Assuming `hello` is in PATH

```sh
nix-store -q --tree $(realpath $(which hello))
```

## Show package dependencies including size

```sh
nix path-info -hSr nixpkgs#hello
```

## Show the things that will change on reboot

```sh
diff <(nix-store -qR /run/current-system) <(nix-store -qR  /run/booted-system)
```
