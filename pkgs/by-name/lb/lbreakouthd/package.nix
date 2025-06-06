{
  lib,
  SDL2,
  SDL2_image,
  SDL2_mixer,
  SDL2_ttf,
  directoryListingUpdater,
  fetchurl,
  stdenv,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "lbreakouthd";
  version = "1.1.11";

  src = fetchurl {
    url = "mirror://sourceforge/lgames/lbreakouthd-${finalAttrs.version}.tar.gz";
    hash = "sha256-QFqNGv2+XXe1Dt8HAoqXEHWXFNU/IQ2c9FYEqehrWdI=";
  };

  buildInputs = [
    SDL2
    SDL2_image
    SDL2_mixer
    SDL2_ttf
  ];

  hardeningDisable = [ "format" ];

  passthru.updateScript = directoryListingUpdater {
    inherit (finalAttrs) pname version;
    url = "https://lgames.sourceforge.io/LBreakoutHD/";
    extraRegex = "(?!.*-win(32|64)).*";
  };

  meta = {
    homepage = "https://lgames.sourceforge.io/LBreakoutHD/";
    description = "Widescreen Breakout clone";
    license = lib.licenses.gpl2Plus;
    mainProgram = "lbreakouthd";
    maintainers = with lib.maintainers; [ ];
    inherit (SDL2.meta) platforms;
    broken = stdenv.hostPlatform.isDarwin;
  };
})
