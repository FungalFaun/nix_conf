# https://docs.xfce.org/xfce/thunar/archive
{
  pkgs,
  ...
}:{
  environment.systemPackages = with pkgs; [
    usbutils
    udiskie
    udisks
    gvfs
    ntfs3g
  ];

  programs = {
    thunar.plugins = with pkgs.xfce; [ 
      # TODO Configure unzip shortcut
      thunar-archive-plugin
      thunar-media-tags-plugin
    ];

    gnome-disks.enable = true;
  };

  services = {
    devmon.enable = true;
    gvfs.enable = true;
    udisks2.enable = true;
    tumbler.enable = true;
  };

# unzip.tap
# install to $(libexecdir)/thunar-archive-plugin/
# https://www.gnu.org/prep/standards/html_node/Directory-Variables.html#index-libexecdir
#   tapfile = ''
# #!/bin/sh
# #
# # unzip.tap - Wrapper script to create and extract archive files in Thunar,
# #           via the thunar-archive-plugin, using unzip.
# #
# # $Id$
# #
# # Copyright (c) 2006 Benedikt Meurer <benny@xfce.org>.
# #
# # This program is free software; you can redistribute it and/or modify it
# # under the terms of the GNU General Public License as published by the Free
# # Software Foundation; either version 2 of the License, or (at your option)
# # any later version.
# #
# # This program is distributed in the hope that it will be useful, but WITHOUT
# # ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# # FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
# # more details.
# #
# # You should have received a copy of the GNU General Public License along with
# # this program; if not, write to the Free Software Foundation, Inc., 59 Temple
# # Place, Suite 330, Boston, MA  02111-1307  USA.
# #
#
# # determine the action and the folder, $@ then contains only the files
# action=$1; shift;
# pwd=$1; shift;
#
# # check the action
# case $action in
# # create)
# # 	exec unzip -q "$@"
# # 	;;
#
# extract-here)
# 	exec unzip -q "$@" -d "$pwd" 	
#   ;;
#
# extract-to)
# 	exec unzip -q "$@"
# 	;;
#
# *)
# 	echo "Unsupported action '$action'" >&2
# 	exit 1
# esac
#   '';
}
