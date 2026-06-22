{ pkgs, ... }:

{
  programs.git = {
    enable = true;

    userName = "Nathan Farrel";
    userEmail = "nathanfarrel1128@gmail.com";

    extraConfig = {
      init = {
        defaultBranch = "main";
      };
    };
  };
}
