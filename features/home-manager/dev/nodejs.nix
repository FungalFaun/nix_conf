{
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    nodejs_24
    yarn
    prisma
    prisma-engines
  ];
}