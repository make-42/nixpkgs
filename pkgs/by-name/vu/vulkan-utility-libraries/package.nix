{
  lib,
  stdenv,
  fetchFromGitHub,
  cmake,
  python3,
  vulkan-headers,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "vulkan-utility-libraries";
  version = "1.4.313.0";

  src = fetchFromGitHub {
    owner = "KhronosGroup";
    repo = "Vulkan-Utility-Libraries";
    rev = "vulkan-sdk-${finalAttrs.version}";
    hash = "sha256-MmC4UVa9P/0h7r8IBp1LhP9EztwyZv/ASWKKj8Gk1T8=";
  };

  nativeBuildInputs = [
    cmake
    python3
  ];
  buildInputs = [ vulkan-headers ];

  meta = with lib; {
    description = "Set of utility libraries for Vulkan";
    homepage = "https://github.com/KhronosGroup/Vulkan-Utility-Libraries";
    platforms = platforms.all;
    license = licenses.asl20;
    maintainers = with maintainers; [ nickcao ];
  };
})
