{ den, ... }:
{
  den.aspects.nevan = {
    includes = [
      den.batteries.define-user
      den.batteries.primary-user
      (den.batteries.user-shell "fish")

      den.aspects.apps.browser
      den.aspects.apps.creativity
      den.aspects.apps.editors
      den.aspects.apps.terminal

      den.aspects.coding.lsp

      den.aspects.desktop.niri
      den.aspects.desktop.noctalia

      den.aspects.utils.cli
      den.aspects.utils.fonts
    ];

    user.extraGroups = [ "input" ];
  };
}
