#!/usr/bin/env bash

# Tell this script to exit if there are any errors.
set -oue pipefail

# Remove extra repos
ls -l /etc/yum.repos.d/
rm -rf /etc/yum.repos.d/_copr:copr.fedorainfracloud.org:phracek:PyCharm.repo
rm -rf /etc/yum.repos.d/google-chrome.repo
rm -rf /etc/yum.repos.d/fedora-updates-archive.repo
rm -rf /etc/yum.repos.d/fedora-updates-testing.repo
rm -rf /etc/yum.repos.d/fedora-updates-testing-modular.repo
rm -rf /etc/yum.repos.d/rpmfusion-nonfree-steam.repo

ls -l /etc/yum.repos.d/