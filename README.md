## How to use

download u-boot image from `https://github.com/Guation/radxa-cubie-a5e-u-boot/releases`

Use `Win32DiskImager`, `balenaEtcher`, or other tools.

Write the image to your TF card.

Connect to the board card via serial port and initiate.

Input `sunxi_dram_para` on the u-boot console.

Pay attention to the four parameters: `tpr6`, `tpr10`, `tpr11`, and `tpr12`

## build

##### Initialize the environment

It is recommended to use an Ubuntu:24 virtual machine.

**Please execute using a user with a user ID of 1000 instead of the root user.**

If Docker hasn't been installed, install it. [Link](https://docs.docker.com/engine/install)

If nodejs hasn't been installed, install it. [Link](https://nodejs.org/en/download)

Do `groups | grep docker || usermod -aG docker $(users)`, Add Docker permissions for the current user.

Exit the shell and log in again for the configuration to take effect.

##### build image
```
git clone --recurse-submodules https://github.com/Guation/radxa-cubie-a5e-u-boot.git
cd radxa-cubie-a5e-u-boot/u-boot-aw2501/src
git config --local user.name user
git config --local user.email user@armbian.com
git am < ../../0001-add-sunxi_dram_para-command.patch
cd ..
npm install -g @devcontainers/cli
devcontainer build --workspace-folder .
devcontainer up --workspace-folder .
devcontainer exec --workspace-folder . make deb
cd ..
bash pack_image.sh
```
