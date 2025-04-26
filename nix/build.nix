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
  pkg-config,
  fetchFromGitHub
}:

with pkgs; stdenv.mkDerivation {
  pname = "pnix-dev";
  version = "latest";
  
  src = fetchFromGitHub {
    owner = "php";
    repo = "php-src";
    rev = "php-8.4.6";
    sha256 = "5GsK95kHhgtbPedP3se5DzYkCoUd0KAnVVSL+iOnwxM=";
  };


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
    ./buildconf --force
    ./configure --enable-debug
  '';
  buildPhase = ''
    make -j$(nproc)
  '';
}