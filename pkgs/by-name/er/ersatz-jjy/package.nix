{
  alsa-lib,
  cmake,
  fetchFromGitHub,
  lib,
  libjack2,
  pkg-config,
  portaudio,
  stdenv,
}:
stdenv.mkDerivation rec {
  pname = "ersatz-jjy";
  version = "0.4";

  src = fetchFromGitHub {
    owner = "ddelabru";
    repo = "ersatz-jjy";
    tag = "v${version}";
    hash = "sha256-7bx/6VrLC1X658oZwFFdCNDQIrDhaGc8J3VwUxnc6Ow=";
  };

  nativeBuildInputs = [
    cmake
    pkg-config
  ];

  buildInputs = [
    libjack2
    portaudio
  ] ++ lib.optionals (lib.meta.availableOn stdenv.hostPlatform alsa-lib) [ alsa-lib ];

  meta = with lib; {
    description = "JJY time code simulator";
    license = licenses.gpl3;
    homepage = "https://github.com/ddelabru/ersatz-jjy";
    maintainers = with lib.maintainers; [ ddelabru ];
    platforms = lib.platforms.unix;
  };
}
