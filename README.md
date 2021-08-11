# Linux-config

My personal linux configuration files (dotfiles).

## Installation

Clone this repository, add or modify configuration files in `conf/` folder, and then execute

```shell
bash setup.sh install conf/{conf_filename}
```

This will create several symbolic links from your home directory to this directory based on the rules in the configuration file.

For example, if you only want to use vim configuration, type the following command

```shell
bash setup.sh install conf/vim.conf
```

If there are files to be overwritten, then they will be moved into `.backup` folder.

Type

```shell
bash setup.sh revert
```

can recover the backup files.

To remove all symbolic links created, run

```shell
bash setup.sh remove
```

See `conf/` folder for example configuration file.
