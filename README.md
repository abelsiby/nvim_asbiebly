# My NVIM Config
![output](

https://github.com/user-attachments/assets/ca3e5614-fbf8-43ba-8b0f-cb5cc3b4a66f

)




## 📋 Requirements
- GCC
- Kitty 0.28+
- Neovim 0.9.4+
- Python 3.10+
- Ripgrep 11.0+
- Quarto
- Npm 10.8.1+
- ImageMagick
- Lua 5.1
- Required python packages:
    - [`pynvim`](https://github.com/neovim/pynvim)
    - [`jupyter_client`](https://github.com/jupyter/jupyter_client)
    - [`cairosvg`](https://cairosvg.org)
    - [`plotly`](https://plotly.com/python/) and [`kaleido`](https://github.com/plotly/Kaleido)
    - [`pyperclip`](https://github.com/asweigart/pyperclip)
    - [`nbformat`](https://github.com/jupyter/nbformat)
    - [`pillow`](https://pypi.org/project/pillow/)
    - [`ipykernel`](https://pypi.org/project/ipykernel/)

## ✨ Feature Highlights
- Carefully designed [configuration](#configuration) file structure for easy extension and modification
- Beautiful colorscheme from [onedark](https://github.com/neanias/everforest-nvim))
- Powerful file explorer with [nvim-tree](https://github.com/nvim-tree/nvim-tree.lua)
- Fuzzy search and preview files, words and gitfiles thanks to [telescope](https://github.com/nvim-telescope/telescope.nvim)
- Preconfigured highlighting and Lsp Autocompletion for Python thanks to [treesitter](https://github.com/nvim-treesitter/nvim-treesitter) and [nvim-lsp-config](https://github.com/neovim/nvim-lspconfig)
- Extensible formatting, diagnostics, code actions and completion with [none-ls](https://github.com/nvimtools/none-ls.nvim) and [ruff](https://github.com/astral-sh/ruff)
- Complete Jupyter Notebook interaction set up thanks to [molten.nvim](https://github.com/benlubas/molten-nvim), [quarto](https://github.com/quarto-dev/quarto-nvim), and [jupytext](https://github.com/GCBallesteros/jupytext.nvim)
- Simple but beautiful status bar thanks to [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)
- Easy buffer navigation with [bufferline.nvim](https://github.com/akinsho/bufferline.nvim)

## 🛠️ Setting up for the first time
>[!WARNING]
> This will only render images if the terminal it's used on is Kitty since ueberzugpp does seem to render images on terminal emulator apps that I tested (gnome-terminal, alacritty)

- Install all the listed dependencies
- Install Kitty
- Install lua 5.1
- Install [luarocks](https://luarocks.org/#quick-start), Lua language's package manager.
- Install the `magick` rock with: `luarocks --local --lua-version=5.1 install magick`
- Create a virtual environment for Neovim in `~/.virtualenvs/`
```bash
mkdir ~/.virtualenvs
cd ~/.virtualenvs
python -m venv neovim
```
- Activate the virtual environment and install the beforementioned python packages with:
```bash
source ~/.virtualenvs/neovim/bin/activate
pip install ipykernel jupytext pynvim jupyter_client cairosvg plotly kaleido pyperclip nbformat pillow
python -m ipykernel
deactivate
```

- Alternatively if you want to use your conda/miniforge base environment:
```bash
conda activate base
ip install ipykernel jupytext pynvim jupyter_client cairosvg plotly kaleido pyperclip nbformat pillow
python -m ipykernel
deactivatpe
```
```bash
mamba activate base
ip install ipykernel jupytext pynvim jupyter_client cairosvg plotly kaleido pyperclip nbformat pillow
python -m ipykernel
deactivate
```
- Install ipykernel and jupytext in your project-scoped virtual environment
```bash
cd whatever/directory/your/project/is/in
source venv/bin/activate
pip install ipykernel jupytext
python -m ipykernel install --user --name project_name
```

- For conda/miniforge, Install ipykernel and jupytext in your in your project conda environment
```bash
conda activate name_of_env
pip install ipykernel jupytext
python -m ipykernel install --user --name project_name
```

- Backup your current Neovim configuration (if you have an existing config, else skip)
```bash
mv ~/.config/nvim ~/config/nvim.bak
```
- Install nvim configurations
```bash
git clone https://github.com/asbiebly/nvim_asbiebly.git ~/.config/nvim && nvim
```
- Run the following commands:
```vim
:UpdateRemotePlugins
:Mason
```
-Delete .git 
```
rm -rf ~/.config/nvim/.git
```
- Open your notebook with the virtual environment activated and load the kernel with `:MoltenInit project_name` or <kbd>Space</kbd> + <kbd>m</kbd> + <kbd>i</kbd>.
- Start executing cells with [Keybindings](#keybindings)
- If :MoltenInit fails to load the ipykernel make sure ` ~/.local/share/jupyter/runtime ` is present, if not create the directory and try :MoltenInit again.

## ⌨️ Keybindings

### Vim actions
| Key                                                                                      | Mode | Action                              |
| ---------------------------------------------------------------------------------------- | :--: | ----------------------------------- |
| <kbd>Ctrl</kbd> + <kbd>h</kbd>                                                           |  i   | Navigate left in insert mode        |
| <kbd>Ctrl</kbd> + <kbd>j</kbd>                                                           |  i   | Navigate down in insert mode        |
| <kbd>Ctrl</kbd> + <kbd>k</kbd>                                                           |  i   | Navigate up in insert mode          |
| <kbd>Ctrl</kbd> + <kbd>l</kbd>                                                           |  i   | Navigate right in insert mode       |
| <kbd>Ctrl</kbd> + <kbd>s</kbd>                                                           |i, v, n| Save current buffer                |
| <kbd>Space</kbd> + <kbd>x</kbd>                                                          |  n   | Close current buffer                |
| <kbd>Tab</kbd>                                                                           |  n   | Go to next buffer                   |
| <kbd>Shift</kbd> + <kbd>Tab</kbd>                                                        |  n   | Go to previous buffer               |

### Plugins

#### NvimTree
| Key                                                                                      | Mode | Action                              |
| ---------------------------------------------------------------------------------------- | :--: | ----------------------------------- |
| <kbd>Ctrl</kbd> + <kbd>n</kbd>                                                           |  n   | Toggle file explorer                |
| <kbd>Ctrl</kbd> + <kbd>j</kbd>                                                           |  n   | Focus file explorer                 |

#### ToggleTerm
| Key                                                                                      | Mode | Action                              |
| ---------------------------------------------------------------------------------------- | :--: | ----------------------------------- |
| <kbd>Ctrl</kbd> + <kbd>t</kbd>                                                           |  n   | Toggle file terminal                |

#### None-ls
| Key                                                                                      | Mode | Action                              |
| ---------------------------------------------------------------------------------------- | :--: | ----------------------------------- |
| <kbd>Space</kbd> + <kbd>g</kbd> + <kbd>f</kbd>                                           |  n   | Format current buffer               |

#### Molten.nvim
| Key                                                                                      | Mode | Action                              |
| ---------------------------------------------------------------------------------------- | :--: | ----------------------------------- |
| <kbd>Space</kbd> + <kbd>m</kbd> + <kbd>i</kbd>                                           |  n   | Molten Init Python Kernel           |
| <kbd>Space</kbd> + <kbd>m</kbd> + <kbd>l</kbd>                                           |  n   | Molten Evaluate Current Line        |
| <kbd>Space</kbd> + <kbd>m</kbd> + <kbd>v</kbd>                                           |  v   | Molten Evaluate Visual Selection    |
| <kbd>Space</kbd> + <kbd>m</kbd> + <kbd>o</kbd>                                           |  n   | Molten Enter Cell Output            |
| <kbd>Space</kbd> + <kbd>m</kbd> + <kbd>h</kbd>                                           |  n   | Molten Hide Output                  |

#### Telescope
| Key                                                                                      | Mode | Action                              |
| ---------------------------------------------------------------------------------------- | :--: | ----------------------------------- |
| <kbd>Space</kbd> + <kbd>f</kbd> + <kbd>f</kbd>                                           |  n   | Telescope Fuzzy Find File           |
| <kbd>Space</kbd> + <kbd>f</kbd> + <kbd>w</kbd>                                           |  n   | Telescope Fuzzy Find Word           |
| <kbd>Space</kbd> + <kbd>f</kbd> + <kbd>b</kbd>                                           |  n   | Telescope Fuzzy Find Buffers        |
| <kbd>Space</kbd> + <kbd>f</kbd> + <kbd>o</kbd>                                           |  n   | Telescope Fuzzy Find Oldfiles       |
| <kbd>Space</kbd> + <kbd>f</kbd> + <kbd>z</kbd>                                           |  n   | Telescope Fuzzy Find Current Buffer |
| <kbd>Space</kbd> + <kbd>f</kbd> + <kbd>h</kbd>                                           |  n   | Telescope Help Tags                 |

#### LSP
| Key                                                   | Mode | Action                                  |
|-------------------------------------------------------| :--: |-----------------------------------------|
| <kbd>g</kbd> + <kbd>D</kbd>                           |  n   | Go to Declaration                       |
| <kbd>g</kbd> + <kbd>d</kbd>                           |  n   | Go to Definition                        |
| <kbd>K</kbd>                                          |  n   | Hover                                   |
| <kbd>g</kbd> + <kbd>i</kbd>                           |  n   | Go to Implementation                    |
| <kbd>leader</kbd> + <kbd>c</kbd> + <kbd>a</kbd>       |  n   | Code Action                             |
| <kbd>Ctrl</kbd> + <kbd>k</kbd>                        |  n   | Signature Help                          |
| <kbd>Space</kbd> + <kbd>w</kbd> + <kbd>a</kbd>        |  n   | Add Workspace Folder                    |
| <kbd>Space</kbd> + <kbd>w</kbd> + <kbd>r</kbd>        |  n   | Remove Workspace Folder                 |
| <kbd>Space</kbd> + <kbd>w</kbd> + <kbd>l</kbd>        |  n   | List Workspace Folders                  |
| <kbd>Space</kbd> + <kbd>D</kbd>                       |  n   | Go to Type Definition                   |
| <kbd>Space</kbd> + <kbd>r</kbd> + <kbd>n</kbd>        |  n   | Rename                                  |
| <kbd>g</kbd> + <kbd>r</kbd>                           |  n   | List References                         |
| <kbd>Space</kbd> + <kbd>e</kbd>                       |  n   | Open Diagnostic Float                   |
| <kbd>[</kbd> + <kbd>d</kbd>                           |  n   | Go to Previous Diagnostic               |
| <kbd>]</kbd> + <kbd>d</kbd>                           |  n   | Go to Next Diagnostic                   |
| <kbd>Space</kbd> + <kbd>q</kbd>                       |  n   | Set to Quickfix list                    | 

## ✏️ Configuration
Directory structure for configuration:
```
├── init.lua                <- Neovim's entrypoint. You should probably not modify anything here. Just require your own files.
├── lua                     <- Configuration for DataNvim goes here.
│   ├── plugins.lua         <- Empty table. It will contain everything inside plugins/
│   ├── vim-options.lua     <- Vim options and general movement keybindings.
│   ├── plugins             <- This folder contains all of your plugins. To install new ones, create a file and make it return your plugin.
│   │   └── plugin_name.lua <- Returns a table with the plugin to install and its configuration.
```
## Uninstall
To uninstall:
```
rm -rf ~/.config/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.local/share/nvim
```
