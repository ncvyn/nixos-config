{
  den.aspects.apps.docker = {
    nixos.virtualisation.docker.enable = true;
  };

  den.aspects.nevan.user.extraGroups = [ "docker" ];
}
