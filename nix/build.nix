{
  stdenv,
  pkgs,
  re2c,
  bison,
  autoconf,
  gnumake,
  libtool,
  ccache,
  libxml2,
  sqlite,
  pkg-config
}:

with pkgs; stdenv.mkDerivation {
  pname = "pnix-dev";
  version = "latest";
  src = ./..;
  vendorSha256 = null;
  doCheck = false;
  enableParallelBuilding = true;
  outputs = [ "out" ];

  buildInputs = [ re2c
  bison
  autoconf
  gnumake
  libtool
  ccache
  libxml2
  sqlite
  pkg-config ];
  prePatch = ''
    ./buildconf
    ./configure --enable-debug
  '';
  buildPhase = ''
    make -j$(nproc)
  '';
}