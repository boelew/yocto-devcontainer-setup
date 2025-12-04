# Default Yocto Environment in Yocto

## Prepare

In the `prepare-project` folder you find several files in which you can configure your project.
Modify the following files:
- `prepare-project/common/project-setup.sh`
- `prepare-project/conf/conf-notes.txt`
- `prepare-project/conf/conf-summary.txt`
- `prepare-project/conf/local.conf`
- `prepare-project/conf/site.conf`

## Dev Containers

The development environment should run in a devcontainer.
Press ```CTRL+SHIFT+P``` and choose `Dev Containers: Open folder in container`

This will automatically setup the project.

## Bitbake

To start building with bitbake you need to source the poky environment.
Run the following script to do that:

```bash
source ./yocto-dev-environment/workdir/scripts/yocto_shell.sh
```

## Notes

Building with Yocto via this devcontainer can only be done on `case-sensitive filesystems`.