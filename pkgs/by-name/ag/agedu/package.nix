{
  lib,
  stdenv,
  fetchgit,
  cmake,
  halibut,
}:
let
  date = "20241013";
  rev = "3622eda";
in
stdenv.mkDerivation {
  pname = "agedu";
  version = "${date}.${rev}";

  # upstream provides tarballs but it seems they disappear after the next version is released
  src = fetchgit {
    url = "https://git.tartarus.org/simon/agedu.git";
    inherit rev;
    hash = "sha256-ZU2bVVo//mAVtVtrKPQ20wZHip/AZPmlL2uaCBcc7rw=";
  };

  nativeBuildInputs = [
    cmake
    halibut
  ];

  meta = with lib; {
    description = "Unix utility for tracking down wasted disk space";
    longDescription = ''
      Most Unix file systems, in their default mode, helpfully record when a
      file was last accessed. So if you generated a large amount of data years
      ago, forgot to clean it up, and have never used it since, then it ought
      in principle to be possible to use those last-access time stamps to tell
      the difference between that and a large amount of data you're still
      using regularly.

      agedu uses this information to tell you which files waste disk space when
      you haven't used them since a long time.
    '';
    homepage = "https://www.chiark.greenend.org.uk/~sgtatham/agedu/";
    license = licenses.mit;
    maintainers = with maintainers; [ symphorien ];
    platforms = platforms.unix;
    mainProgram = "agedu";
  };
}
