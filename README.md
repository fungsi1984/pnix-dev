[![Hercules CI](https://hercules-ci.com/api/v1/site/github/account/fungsi1984/project/pnix-dev/badge)](https://hercules-ci.com/github/fungsi1984/pnix-dev/status)
# Compile php with nix ci
adding nix in php without being destructive and focusing x86_64-linux development
compile with ./configure --enable-debug

### compile with nix
```
nix build -f nix
```

### check version
```
./result/bin/php --version

```