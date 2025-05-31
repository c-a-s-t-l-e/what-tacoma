{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  nativeBuildInputs = with pkgs; [
    clang
    cmake
    ninja
    pkg-config

    gtk3
    xapp # For xapp-gtk3-module
    libepoxy # Crucial for GTK's OpenGL interaction

    flutter
  ];

  LD_LIBRARY_PATH = with pkgs; lib.makeLibraryPath [
    fontconfig.lib
    sqlite.out
    mesa # Provides libGL.so (OpenGL implementation)
    mesa.drivers # Provides the actual OpenGL drivers (e.g., swrast, i965, radeon, nouveau)
    libglvnd # GL Vendor Neutral Dispatch library
    # The X11 dependencies that were already added:
    xorg.libXrandr
    xorg.libXi
    xorg.libXcursor
    xorg.libXdamage # Often needed for Gtk GL context
    xorg.libXcomposite # Can be needed for compositing
    libxkbcommon # For keyboard input

    # EGL/DRM components that were already added:
    libdrm # Direct Rendering Manager (used by Mesa)
    libva # Video Acceleration API (sometimes needed for Mesa drivers)
    libvdpau # Video Decode and Presentation API for Unix (sometimes needed)
  ] + ":${pkgs.lib.escapeShellArg (builtins.getEnv "PWD")}/build/linux/x64/debug/bundle/lib"; # <--- THIS IS THE CRUCIAL NEW LINE

  # Gtk configuration
  GSETTINGS_SCHEMA_DIR = "${pkgs.gtk3}/share/gsettings-schemas/${pkgs.gtk3.name}/glib-2.0/schemas/";
  GTK_PATH = "${pkgs.xapp}/lib/gtk-3.0";

  # IMPORTANT: REMOVE/COMMENT OUT THIS LINE NOW!
  # We want to test hardware rendering first, as the software rendering test was misleading.
  # FLUTTER_ENGINE_FORCE_SOFTWARE_RENDERING=true;
}
