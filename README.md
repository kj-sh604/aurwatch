# aurwatch

check for aur package updates and optionally download updated pkgbuilds.

queries the aur rpc api for foreign packages, filters out devel (-git, -hg, -svn, etc.) false positives by checking upstream repos for new commits, then prompts to download the updated pkgbuilds.

## Arch Linux Dependencies (System Packages)

- pacman (libalpm)
- curl
- git
- python (for json parsing)
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

lists foreign packages with version mismatches against the aur.

for devel packages (vcs suffixes), fetches the pkgbuild, runs makepkg --printsrcinfo to expand source urls, then compares the installed commit hash against git ls-remote HEAD. 

only shows a devel update if upstream has actually moved.

uses gitaur from path if available, falls back to plain git clone.

## License

0BSD
