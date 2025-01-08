# ensure third-party sources for apt don't get removed when doing a release upgrade
# (otherwise it breaks the upgrade on hosters who provide their own dpkg repos)
alias do-release-upgrade="RELEASE_UPGRADER_ALLOW_THIRD_PARTY=1 /usr/bin/do-release-upgrade"
