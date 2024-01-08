# Conan

## Conan Install

Install:

  pip install --user conan

Upgrade:

  pip install -U conan

## Conan Configuration

Do it once or on file modification.

  conan config install tool/conan/settings_user.yml
  conan config install -sf tool/conan/profiles -tf profiles .
