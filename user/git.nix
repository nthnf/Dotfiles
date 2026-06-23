{ pkgs, ... }:

{
  programs.git = {
    enable = true;

    settings = {
      init = {
        defaultBranch = "main";
      };

      user.name = "Nathan Farrel";
      user.email = "nathanfarrel1128@gmail.com";
    };
  };
}
