# aurwatch

Check for AUR package updates and optionally download the updated PKGBUILDs.

Queries the AUR RPC API for foreign packages, filters out devel (-git, -hg,
-svn, etc.) false positives by checking upstream repos for new commits, then
prompts to download the updated PKGBUILDs.

## Arch Linux Dependencies (System Packages)

- pacman (libalpm)
- curl
- git
- jq
- makepkg (pacman, for devel source expansion)

## Quick Run

```
./aurwatch
./aurwatch -d ~/builds/aur
./aurwatch --help
```

## Install

```
make install
```

or manually:

```
mkdir -p ~/.local/bin
install -Dm755 aurwatch ~/.local/bin/aurwatch
```

## Remove

```
make remove
```

## How It Works

Lists foreign packages with version mismatches against the AUR.

For devel packages (VCS suffixes), fetches the PKGBUILD, runs `makepkg
--printsrcinfo` to expand source URLs, then compares the installed commit
hash against `git ls-remote HEAD`.

Only shows a devel update if upstream has actually moved.

Uses `gitaur` from PATH if available, falls back to plain `git clone`.

## License

0BSD
