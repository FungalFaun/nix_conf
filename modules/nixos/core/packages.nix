{
  pkgs,
  ...
}: {
  # for security reasons, do not load neovim's user config
  # since EDITOR may be used to edit some critical files
  environment = {
    variables.EDITOR = "nvim --clean";
  
    systemPackages = with pkgs; [
      zsh
      neovim
      git
      just

      # Archives
      zip
      xz
      p7zip

      procs
      btop

      jq # A lightweight and flexible command-line JSON processor
      fzf
      fd # search for files by name, faster than find
      ripgrep
      
      wget
      curl
      httpie
      nmap # A utility for network discovery and security auditing
      iperf3 # network performance test
      
      hyperfine
      
      # File transfer
      rsync
      # croc

      # Security
      # libargon2
      openssl

      file
      which
      tree
      tealdeer

      # system call monitoring
      strace
      ltrace
      lsof

      # system monitoring
      # sysstat
      # iotop-c
      # iftop
      # nmon
      # sysbench
      # systemctl-tui

      # pciutils # lspci
      # usbutils # lsusb
      # hdparm # for disk performance, command
      # dmidecode # a tool that reads information about your system's hardware from the BIOS according to the SMBIOS/DMI standard
      # parted
    ];
  };


  
}