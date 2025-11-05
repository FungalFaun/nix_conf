{
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    LycheeSlicer
    bambu-studio
  ];

  xdg.desktopEntries = {
    LycheeSlicer = {
      name = "LycheeSlicer";
      type = "Application";
      exec = "LycheeSlicer";
      categories = ["Printing" "3D"];
      mimeType = [
        "model/stl"
        "application/octet-stream"
      ];
      comment = "3D-printing program for resin prints";
    };
  };

  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [
      # Add bambu-studio version
    ];
  };
}
