{
  lib,
  fetchFromSourcehut,
  rustPlatform,
}:

rustPlatform.buildRustPackage rec {
  pname = "swayr";
  version = "0.27.4";

  src = fetchFromSourcehut {
    owner = "~tsdh";
    repo = "swayr";
    rev = "swayr-${version}";
    sha256 = "sha256-dliRPKtCJ6mbBl87QoDsHJ2+iaI9nVsWWWwWAkQ1RqE=";
  };

  useFetchCargoVendor = true;
  cargoHash = "sha256-n32mjAycWaNjYUU1gGUwZmH+3plsf+gXB9Tdt0I0D+c=";

  patches = [
    ./icon-paths.patch
  ];

  # don't build swayrbar
  buildAndTestSubdir = pname;

  preCheck = ''
    export HOME=$TMPDIR
  '';

  meta = {
    description = "Window switcher (and more) for sway";
    homepage = "https://git.sr.ht/~tsdh/swayr";
    license = lib.licenses.gpl3Plus;
    mainProgram = "swayr";
    maintainers = with lib.maintainers; [ artturin ];
    platforms = lib.platforms.linux;
  };
}
