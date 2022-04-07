# slackbuilds

## Disclaimer

These are mostly modified SlackBuilds from other sources (SBo, alienBOB, ponce or conraid / slackers), version bumped and / or modified (usually I add note in README). Some of them miss info files, and slack-desc is placeholder basically. This should be fixed, but not sure if I will be keeping nix, guix and guile deps.

## Binary repository

If you'd like some already compiled packages (mostly SBo builds, some customized, some packaged from scratch), add below repository to your `slackpkgplus.conf` or `slpkg` custom repositories:

* https://repositories.lanius.one/slackware/15.0/x86_64/

There is also `ubuntu` directory, with 2 debs. If you'd somehow bump into this README and need i3 workspaces plugin for a deb based repo (these are tested on Ubuntu 20.04 and Devuan Chimaera / Debian Bullseye), so feel free to use them. Workspaces plugin sometimes goes wild after i3 restart and eats one CPU core whole, but it's not Debian specific: same happened to me on Slackware. Although it's pretty rare. I believe on Devuan / Debian it never happened to me actually.
