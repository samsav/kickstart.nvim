# samsav's kickstart.nvim

This is my personal fork of [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim).
If you're getting into Neovim, I highly recommend that you start kickstart.nvim:
it's a great learning resource.

Another resource I recommend is
[The Only Video You Need to Get Started with Neovim](https://youtu.be/m8C0Cq9Uv9o)

## Deploying this configuration on a new machine

Install Neovim:

```sh
brew install neovim
```

Clone this repository:

```sh
git clone https://github.com/samsav/kickstart.nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
```

Open Neovim and run `Lazy sync` to install the plugins.
