{...}: {
  programs.git = {
    enable = true;

    userName = "Andrew Zah";
    userEmail = "zah@andrewzah.com";

    aliases = {
      aliases = "!git config --list | grep 'alias\\.' | sed 's/alias\\.\\([^=]*\\)=\\(.*\\)/\\1\\ \t => \\2/' | sort";
      churn = "!git log --all -M -C --name-only --format='format:' \"$@\" | sort | grep -v '^$' | uniq -c | sort | awk 'BEGIN {print \"count,file\"} {print $1 \",\" $2}'";
      l = "!f() { git log $* | grep '^commit ' | cut -f 2 -d ' '; }; f";
      please = "push --force-with-lease";
      tags = "tag -l";
      overview = "log --all --oneline --no-merges";
      recap = "log --all --pretty=format:'%h %ad %s' --no-merges --author=<zah@andrewzah.com> --date=short";
      st = "status --short --branch";
    };

    extraConfig = {
      color.ui = true;
      commit.gpgsign = true;
      core.editor = "nvim";
      diff.indentHeuristic = "on";
      filter.lfs = {
        clean = "git-lfs clean -- %f";
        smudge = "git-lfs smudge -- %f";
        process = "git-lfs filter-process";
        required = true;
      };
      init = {
        defaultBranch = "master";
      };
      log.date = "relative";

      user = {
        email = "zah@andrewzah.com";
        name = "Andrew Zah";
        signingkey = "D87BD9DCF11BACD6CDB40CB213732FB13E61E0BE";
      };
    };
  };
}
