{
  pkgs,
  ...
}: {
  home.packages = [
    pkgs.blender
  ];

  xdg.desktopEntries = {
    Blender = {
      name = "Blender";
      type = "Application";
      exec = "Blender";
      icon = "./blender.ico";
      categories = [
        # Core
        "Graphics"
        # Aditional
        "Building"
        "2DGraphics"
        "3DGraphics"
        "Printing"
        "Construction"
      ];
      mimeType = [
        "model/stl"
        "application/octet-stream"
      ];
      comment = "Open Source 3D modeling program";
    };
  };
}