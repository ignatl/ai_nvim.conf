# ai_nvim.conf

This is my personal Neovim setup, focused on a clean and productive coding environment.

## Key Features

- **Completion & Snippets:** `blink.cmp` + `friendly-snippets`
- **Plugin Management:** `lazy.nvim`
- **LSP & Tools Management:** `mason.nvim` (manages language servers, linters, and formatters)
- **Color Scheme:** `monokai.nvim`
- **Keybinding Helper:** `which-key.nvim`
- **Python LSP:** `ty`

Other minor or optional plugins are included and loaded as needed.

## Requirements

- Neovim 0.10+ (recommended)
- Git
- Python 3.x (for Python-related tools)

## Installation

1. Backup your current config:
    ```bash
    mv ~/.config/nvim ~/.config/nvim.backup
    ```
2. Clone this repository:
    ```bash
    git clone git@github.com:ignatl/ai_nvim.conf.git ~/.config/nvim
    ```
3. Open Neovim to let `lazy.nvim` install plugins:
    ```bash
    nvim
    ```
4. Install language tools via Mason:
    ```bash
    :Mason
    ```

## ToDo
- **Side File Menu (Explorer)** with `nvim‑tree`
- **Tabs & Buffers UI** via `bufferline`
- **Linting & Formatting** with `ruff` and `mypy`
- **Syntax Highlighting** using `nvim-treesitter`
- **File Navigation** via `telescope.nvim`
- **Git Integration** with `gitsigns.nvim`

## Contributing
This is my personal setup. Feel free to fork and adapt it to your workflow. Pull requests are welcome.

## License
MIT License.

