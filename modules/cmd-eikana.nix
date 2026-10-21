{ pkgs }:

pkgs.stdenv.mkDerivation {
  pname = "cmd-eikana";
  version = "2.6.0";

  src = pkgs.fetchurl {
    url = "https://github.com/dominion525/cmd-eikana/releases/download/v2.6.0/cmd-eikana-v2.6.0-arm64.zip";
    hash = "sha256-SdVQPKtNAdZ69v8T+WPU/6cS0wOJPUWemOuUaTMePEo=";
  };

  dontUnpack = true;
  nativeBuildInputs = [ pkgs.unzip ];

  installPhase = ''
    mkdir -p "$out/Applications" "$out/bin"
    unzip -q "$src"
    app="$(find . -maxdepth 2 -type d -name '*.app' | head -n 1)"

    if [ -z "$app" ]; then
      echo "No .app bundle found in release archive" >&2
      exit 1
    fi

    app_name="$(basename "$app")"
    cp -R "$app" "$out/Applications/"

    cat > "$out/bin/cmd-eikana" <<EOF
#!/bin/sh
exec open "$out/Applications/$app_name"
EOF
    chmod +x "$out/bin/cmd-eikana"
  '';

  meta = with pkgs.lib; {
    description = "Apple Silicon fork of cmd-eikana app";
    homepage = "https://github.com/dominion525/cmd-eikana";
    license = licenses.mit;
    platforms = platforms.darwin;
  };
}
