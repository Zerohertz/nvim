<div align="center">
    <h2>
        🌝 Neovim Config 🌝
    </h2>
    <img width="1773" alt="neovim" src="https://github.com/user-attachments/assets/15110871-bc98-4d9a-a855-c975638bb45a" />
</div>

<!--markdownlint-disable-->

```sh
$ brew install font-hack-nerd-font
$ ln -sf ${PWD}/nvim ${HOME}/.config/nvim
```

<!--markdownlint-enable-->

---

### [`keymaps`](lua/config/keymaps.lua)

<div align="right"><code>&lt;leader&gt;</code>: <code>Space</code></div>

<div align="center">

|                            Key                            |   Mode   | Action                                                                                                    |
| :-------------------------------------------------------: | :------: | :-------------------------------------------------------------------------------------------------------- |
|                     `Control h,j,k,l`                     | `NORMAL` | Window Navigation                                                                                         |
|                     `Control w,a,s,d`                     | `NORMAL` | Window Size Control                                                                                       |
|       <code>&lt;leader&gt;</code> + <code>\|</code>       | `NORMAL` | Split Window                                                                                              |
|             <code>&lt;leader&gt;</code> + `h`             | `NORMAL` | `:checkhealth`                                                                                            |
|             <code>&lt;leader&gt;</code> + `e`             | `NORMAL` | Open [Neotree](https://github.com/nvim-neo-tree/neo-tree.nvim)                                            |
|          <code>&lt;leader&gt;</code> + `b` + `e`          | `NORMAL` | Buffer Exploler                                                                                           |
|          <code>&lt;leader&gt;</code> + `b` + `o`          | `NORMAL` | Delete Other Buffers                                                                                      |
|             <code>&lt;leader&gt;</code> + `D`             | `NORMAL` | Open [DB UI](https://github.com/kristijanhusak/vim-dadbod-ui)                                             |
|          <code>&lt;leader&gt;</code> + `f` + `t`          | `NORMAL` | Open Terminal                                                                                             |
|          <code>&lt;leader&gt;</code> + `f` + `l`          | `NORMAL` | Open [Telescope](https://github.com/nvim-telescope/telescope.nvim)                                        |
| <code>&lt;leader&gt;</code> + <code>&lt;leader&gt;</code> | `NORMAL` | Open Find File                                                                                            |
|          <code>&lt;leader&gt;</code> + `g` + `g`          | `NORMAL` | Open [LazyGit](https://github.com/jesseduffield/lazygit)                                                  |
|          <code>&lt;leader&gt;</code> + `u` + `n`          | `NORMAL` | Dissmiss All Notifications                                                                                |
|             <code>&lt;leader&gt;</code> + `y`             | `VISUAL` | Copying to the Clipboard in an SSH Environment Using [OSC 52](https://sw.kovidgoyal.net/kitty/clipboard/) |

</div>

### Commands

- `:%s/{FIND_STRING}/{REPLACE_STRING}/g`: 문자열 변경 (~= `sed`)
  - `g`: Global search
  - `c`: Ask for confirmation first
  - `i`: Case insensitive
- `:JdtUpdateConfig`: `build.gradle`의 의존성 수정 후 `jdtls`의 update를 원할 때 사용
- `:LspInfo`: LSP (language server protocol) info
- `:NullLsInfo`: [`none-ls`](https://github.com/nvimtools/none-ls.nvim) info
- `:ConformInfo`: [`conform`](https://github.com/stevearc/conform.nvim) info

---

### References

- [VimAwesome](https://vimawesome.com/)
