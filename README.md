<div align="center">
    <h2>
        🌝 Neovim Config 🌝
    </h2>
    <a href="https://deepwiki.com/Zerohertz/nvim"><img src="https://deepwiki.com/badge.svg" alt="Ask DeepWiki"></a>
</div>
<br/>

<!--markdownlint-disable-->

```sh
$ brew install font-hack-nerd-font
$ mkdir -p $(HOME)/.config && rm -rf $(HOME)/.config/nvim
$ ln -sf $(PWD)/.config/nvim $(HOME)/.config/nvim
$ cd $(PWD)/.config/nvim && git switch main && git pull origin main
```

<!--markdownlint-enable-->

<div align="center">
    <img width="1773" alt="neovim" src="https://github.com/user-attachments/assets/15110871-bc98-4d9a-a855-c975638bb45a" />
</div>

<h4 align = "center">
    <a href="https://hub.docker.com/r/zerohertzkr/dev">🐳 Docker 🐳</a>
    <br/>
    <br/>
    <a href = "https://hub.docker.com/r/zerohertzkr/dev"><img src="https://img.shields.io/docker/v/zerohertzkr/dev?style=for-the-badge&logo=Docker&label=zerohertzkr/dev&labelColor=800a0a"/></a>
</h4>

<!-- markdownlint-disable -->

```bash
$ docker run \
        --name $name \
        --platform linux/amd64 \
        -v ./:/home/zerohertz/workspace \
        --rm -d \
        zerohertzkr/dev
$ docker exec -it $name zsh
```

<!-- markdownlint-enable -->

<h4 align = "center">
    <a href="lua/config/keymaps.lua">⌨ <code>keymaps</code> ⌨</a>
</h4>

<div align="right"><code>&lt;leader&gt;</code>: <code>Space</code></div>

<div align="center">

|                            Key                            |   Mode   | Action                                                                                                                                                                           |
| :-------------------------------------------------------: | :------: | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
|                     `Control h,j,k,l`                     | `NORMAL` | Window Navigation                                                                                                                                                                |
|                     `Control w,a,s,d`                     | `NORMAL` | Window Size Control                                                                                                                                                              |
|       <code>&lt;leader&gt;</code> + <code>\|</code>       | `NORMAL` | Split Window                                                                                                                                                                     |
|             <code>&lt;leader&gt;</code> + `h`             | `NORMAL` | `:checkhealth`                                                                                                                                                                   |
|             <code>&lt;leader&gt;</code> + `e`             | `NORMAL` | Open [Snacks explorer](https://github.com/folke/snacks.nvim/blob/main/docs/explorer.md)                                                                                          |
|          <code>&lt;leader&gt;</code> + `b` + `e`          | `NORMAL` | Buffer Exploler                                                                                                                                                                  |
|          <code>&lt;leader&gt;</code> + `b` + `o`          | `NORMAL` | Delete Other Buffers                                                                                                                                                             |
|             <code>&lt;leader&gt;</code> + `D`             | `NORMAL` | Open [DB UI](https://github.com/kristijanhusak/vim-dadbod-ui): `${DATABASE_TYPE}://${DATABASE_USERNAME}:${DATABASE_PASSWORD}@${DATABASE_HOST}:${DATABASE_PORT}/${DATABASE_NAME}` |
|          <code>&lt;leader&gt;</code> + `f` + `t`          | `NORMAL` | Open Terminal                                                                                                                                                                    |
|          <code>&lt;leader&gt;</code> + `f` + `l`          | `NORMAL` | Open [Telescope](https://github.com/nvim-telescope/telescope.nvim)                                                                                                               |
| <code>&lt;leader&gt;</code> + <code>&lt;leader&gt;</code> | `NORMAL` | Open Find File                                                                                                                                                                   |
|          <code>&lt;leader&gt;</code> + `g` + `g`          | `NORMAL` | Open [LazyGit](https://github.com/jesseduffield/lazygit)                                                                                                                         |
|          <code>&lt;leader&gt;</code> + `u` + `f`          | `NORMAL` | Enable/Disable auto format                                                                                                                                                       |
|          <code>&lt;leader&gt;</code> + `u` + `n`          | `NORMAL` | Dissmiss All Notifications                                                                                                                                                       |
|          <code>&lt;leader&gt;</code> + `d` + `d`          | `NORMAL` | Display diagnostic information                                                                                                                                                   |
|             <code>&lt;leader&gt;</code> + `y`             | `VISUAL` | Copying to the Clipboard in an SSH Environment Using [OSC 52](https://sw.kovidgoyal.net/kitty/clipboard/)                                                                        |
|          <code>&lt;leader&gt;</code> + `c` + `v`          | `NORMAL` | Select Python Virtual Environment ([venv-selector](https://github.com/linux-cultist/venv-selector.nvim))                                                                         |

</div>

<h4 align = "center">
    👾 Commands 👾
</h4>

- `:%s/{FIND_STRING}/{REPLACE_STRING}/g`: 문자열 변경 (~= `sed`)
  - `g`: Global search
  - `c`: Ask for confirmation first
  - `i`: Case insensitive
- `:tcd {PATH}`: Tab 단위로 현재 디렉토리 변경
- `:LspInfo`: LSP (language server protocol) info
- `:NullLsInfo`: [`none-ls`](https://github.com/nvimtools/none-ls.nvim) info
- `:ConformInfo`: [`conform`](https://github.com/stevearc/conform.nvim) info
- `:WhichKey`: [which-key](https://github.com/folke/which-key.nvim) info
- `:JdtUpdateConfig`: `build.gradle`의 의존성 수정 후 `jdtls`의 update를 원할 때 사용

<h4 align = "center">
     ⚒️ Debug ⚒️
</h4>

```vim
vim.notify("Hello, World!", vim.log.levels.INFO, { title = "INFO LOG TEST" })
vim.notify("Hello, World!", vim.log.levels.ERROR, { title = "ERROR LOG TEST" })
```

<div align="center">
    <img width="479" alt="Screenshot 2025-02-27 at 8 28 05 PM" src="https://github.com/user-attachments/assets/244511fe-3791-462f-a95a-8163bb7e761a" />
</div>

---

<h4 align = "center">
    📜 References 📜
</h4>

- [VimAwesome](https://vimawesome.com/)
