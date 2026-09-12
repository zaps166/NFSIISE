{ lib
, stdenv
, fetchFromGitHub
, yasm
, makeWrapper
, pkg-config
, SDL2
, libGL
, libGLU
, curl
, p7zip
, self
}:

let

  isoUrl = "https://archive.org/download/need-for-speed-ii-special-edition-cd/need-for-speed-ii-special-edition.iso";

  gameAssets = stdenv.mkDerivation {
    pname = "nfs2se-assets";
    version = "1.0.0";

    nativeBuildInputs = [ curl p7zip ];

    outputHashAlgo = "sha256";
    outputHashMode = "recursive";
    # If 'nix build' outputs has hash mismatch error, paste new hash here
    outputHash = "sha256-/xqjRLCW44SuCKcvGnI17sGQSHdaZyOESjV5NuV+uhg=";

    # Bypass normal unpacking stages since we use a local dummy folder
    dontUnpack = true;

    installPhase = ''
      runHook preInstall
      mkdir -p $out

      curl --progress-bar -L "${isoUrl}" -o temporary_game.iso 2>&1 | tr '\r' '\n'

      echo "Extracting ISO using 7z..."
      7z x temporary_game.iso -oextracted_iso

      # Clean up the large ISO instantly within the sandbox loop to save space
      rm temporary_game.iso

      # Find target folders regardless of DOS casing
      FEDATA_SRC=$(find extracted_iso -type d -iname "fedata" | head -n 1)
      GAMEDATA_SRC=$(find extracted_iso -type d -iname "gamedata" | head -n 1)

      if [ -z "$FEDATA_SRC" ] || [ -z "$GAMEDATA_SRC" ]; then
        echo "Error: Could not find 'fedata' or 'gamedata' folders inside the ISO layout!"
        exit 1
      fi

      mv "$FEDATA_SRC" $out/fedata
      mv "$GAMEDATA_SRC" $out/gamedata

      echo "Converting DOS assets to lowercase..."
      find $out -depth | while read path; do
        dir=$(dirname "$path")
        base=$(basename "$path")
        lowercase_base=$(echo "$base" | awk '{print tolower($0)}')
        if [ "$base" != "$lowercase_base" ]; then
          mv "$path" "$dir/$lowercase_base"
        fi
      done

      runHook postInstall
    '';
  };

in
stdenv.mkDerivation rec {
  pname = "nfs2se";
  version = "1.4.0";

  src = self;

  # Build tools and libraries
  nativeBuildInputs = [
    yasm
    makeWrapper
    pkg-config
  ];

  # Runtime lib dependencies + build headers
  buildInputs = [
    SDL2
    libGL
    libGLU
  ];

  # Skip configure step, by stubbing it by "true" command
  configurePhase = "true";

  buildPhase = ''
    runHook preBuild

    patchShebangs compile_nfs
    chmod +x compile_nfs

    # Execute the project's native compilation script
    ./compile_nfs

    runHook postBuild
  '';

  installPhase = ''
    runHook preInstall

    # Create destination directories in the Nix store
    mkdir -p $out/bin
    mkdir -p $out/share/applications
    mkdir -p $out/share/pixmaps
    mkdir -p $out/share/nfs2se

    # 1. Copy ONLY the executable engine binaries into $out/bin
    for file in "Need For Speed II SE"/nfs2se*; do
      if [ -x "$file" ] && [ ! -d "$file" ]; then
        cp "$file" $out/bin/
      fi
    done

    # 2. Copy the critical support runtime files
    cp "Need For Speed II SE"/install.win $out/share/nfs2se/
    cp "Need For Speed II SE"/text.* $out/share/nfs2se/ 2>/dev/null || true
    cp "Need For Speed II SE"/*.template $out/share/nfs2se/ 2>/dev/null || true

    # Copy your local, lowercased assets directly into the package
    ln -s ${gameAssets}/fedata $out/share/nfs2se/fedata
    ln -s ${gameAssets}/gamedata $out/share/nfs2se/gamedata

    # Wrap the binaries so they execute directly from the asset directory
    for bin in $out/bin/nfs2se*; do
      if [ -x "$bin" ]; then
        mv "$bin" "$bin-unwrapped"
        makeWrapper "$bin-unwrapped" "$bin" \
          --run "cd $out/share/nfs2se"
      fi
    done

    # 5. Copy the native repository icon directly to share/pixmaps
    cp "Need For Speed II SE"/nfs2se.png $out/share/pixmaps/

    # 6. Copy the native repository desktop entry and patch its Exec path
    cp "Need For Speed II SE"/nfs2se.desktop $out/share/applications/
    substituteInPlace $out/share/applications/nfs2se.desktop \
      --replace "Exec=nfs2se" "Exec=$out/bin/nfs2se"

    runHook postInstall
  '';

  meta = with lib; {
    description = "Need for Speed II SE native Linux source port (32-bit)";
    homepage = "https://github.com/zaps166/NFSIISE";
    license = licenses.mit;
    platforms = [ "i686-linux" "x86_64-linux" ];
  };
}
