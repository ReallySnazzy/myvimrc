vim.o.guifont = "MonoLisa Nerd Font:h12"
vim.o.clipboard = "unnamedplus"
vim.o.shiftwidth = 4
vim.o.termguicolors = true
vim.o.number = true

-- Clone 'mini.nvim' manually in a way that it gets managed by 'mini.deps'
local path_package = vim.fn.stdpath('data') .. '/site/'
local mini_path = path_package .. 'pack/deps/start/mini.nvim'
if not vim.loop.fs_stat(mini_path) then
  vim.cmd('echo "Installing `mini.nvim`" | redraw')
  local clone_cmd = {
    'git', 'clone', '--filter=blob:none',
    'https://github.com/nvim-mini/mini.nvim', mini_path
  }
  vim.fn.system(clone_cmd)
  vim.cmd('packadd mini.nvim | helptags ALL')
  vim.cmd('echo "Installed `mini.nvim`" | redraw')
end

-- Set up 'mini.deps' (customize to your liking)
require('mini.deps').setup({ path = { package = path_package } })
MiniDeps = require('mini.deps')

-- Setup leader for lazy and plugins after lazy is setup
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Remove trailing spaces in Lua files to silence the annoying linter
vim.api.nvim_create_autocmd(
  {"BufWritePre"},
  {
    pattern = { "*.lua" },
    command = [[%s/\s\+$//e]],
  }
)

MiniDeps.add {
  source = 'nvim-treesitter/nvim-treesitter'
}

require("nvim-treesitter").setup({
  ensure_installed = { "elixir", "eex", "heex" },
  highlight = { enable = true },
  indent = { enable = true },
})

MiniDeps.add {
  source = "nvim-tree/nvim-web-devicons"
}

MiniDeps.add {
  source = "folke/snacks.nvim"
}

require("snacks").setup {
  ensure_installed = { "elixir", "eex", "heex" },
  highlight = { enable = true },
  indent = { enable = true },
}

vim.keymap.set('n', "<leader>g", function()
  Snacks.lazygit()
end)

MiniDeps.add {
  source = "stevearc/oil.nvim"
}

require("oil").setup()

vim.keymap.set('n', '-', function()
  vim.cmd('Oil --float')
end)

MiniDeps.add {
  source = "nvim-lualine/lualine.nvim"
}

require("lualine").setup()

MiniDeps.add {
  source = "j-hui/fidget.nvim"
}

require("fidget").setup()

MiniDeps.add {
  source = "nvim-lua/plenary.nvim"
}

MiniDeps.add {
  source = "nvim-telescope/telescope.nvim"
}

require("telescope").setup {
  pickers = {
    colorscheme = {
      enable_preview = true
    }
  }
}

local telescope_bindings = {
  {
    "sf",
    function()
      require("telescope.builtin").find_files()
    end,
    desc = "[S]earch [F]iles",
    mode = "n"
  },
  {
    "sk",
    function()
      require("telescope.builtin").keymaps()
    end,
    desc = "[S]earch [K]eymaps",
    mode = "n"
  },
  {
    "sb",
    function()
      require("telescope.builtin").buffers()
    end,
    desc = "[S]earch [B]uffers",
    mode = "n"
  },
  {
    "sr",
    function()
      require("telescope.builtin").resume()
    end,
    desc = "[S]earch [R]esume",
    mode = "n"
  },
  {
    "sh",
    function()
      require("telescope.builtin").help_tags()
    end,
    desc = "[S]earch [S]elp",
    mode = "n"
  },
  {
    "sz",
    function()
      require("telescope.builtin").live_grep()
    end,
    desc = "[S]earch Ripgrep",
    mode = "n"
  },
  {
    "s.",
    function()
      require("telescope.builtin").oldfiles()
    end,
    desc = "[S]earch Recent Files (. for repeat)",
    mode = "n"
  },
  {
    "sc",
    function()
      require("telescope.builtin").colorscheme()
    end,
    desc = "[S]earch [C]olorschemes",
    mode = "n"
  },
  {
    "gd",
    function()
      require("telescope.builtin").lsp_definitions()
    end,
    desc = "[G]oto [D]efinitions",
    mode = "n"
  },
  {
    "gr",
    function()
      require("telescope.builtin").lsp_references()
    end,
    desc = "[G]oto [R]eferences",
    mode = "n"
  },
  {
    "gi",
    function()
      require("telescope.builtin").lsp_implementations()
    end,
    desc = "[G]oto [I]mplementations",
    mode = "n"
  },
  {
    "<leader>D",
    function()
      require("telescope.builtin").lsp_type_definitions()
    end,
    desc = "Type [D]efinition",
    mode = "n"
  },
  {
    "<leader>ds",
    function()
      require("telescope.builtin").lsp_document_symbols()
    end,
    desc = "[D]ocument [S]ymbols",
    mode = "n"
  },
  {
    "<leader>ws",
    function()
      require("telescope.builtin").lsp_dynamic_workspace_symbols()
    end,
    desc = "[W]orkspace [S]ymbols",
    mode = "n"
  }
}

for _, binding in ipairs(telescope_bindings) do
  vim.keymap.set('n', binding[1], binding[2])
end

MiniDeps.add {
  source = "j-hui/fidget.nvim"
}

require("fidget").setup()

MiniDeps.add {
  source = "neovim/nvim-lspconfig"
}

-- require("nvim-lspconfig").setup()

local lspconfig_keybinds = {
  {
    "<leader>rn",
    function()
      vim.lsp.buf.rename()
    end,
    desc = "LSP [R]e[n]ame",
    mode = "n"
  },
  {
    "<leader>ca",
    function()
      vim.lsp.buf.code_action()
    end,
    desc = "LSP [C]ode [A]ction",
    mode = "n"
  },
  {
    "K",
    function()
      vim.lsp.buf.hover()
    end,
    desc = "LSP Hover Documentation",
    mode = "n"
  },
  {
    "gD",
    function()
      vim.lsp.buf.declaration()
    end,
    desc = "LSP [G]oto [D]eclaration",
    mode = "n"
  },
  {
    "]d",
    function()
      vim.diagnostic.goto_next()
    end,
    desc = "Next LSP diagnostic",
    mode = "n",
  },
  {
    "[d",
    function()
      vim.diagnostic.goto_prev()
    end,
    desc = "Previous LSP diagnostic",
    mode = "n",
  }
}

for _, keybind in ipairs(lspconfig_keybinds) do
  vim.keymap.set('n', keybind[1], keybind[2])
end

local lsp_servers = {
  "rust_analyzer",
  "lua_ls"
}
for _, server_name in ipairs(lsp_servers) do
  vim.lsp.enable(server_name)
end

MiniDeps.add {
  source = "ThePrimeagen/harpoon"
}

local harpoon_keybinds = {
  {
    "<leader>ha",
    function()
      require("harpoon.mark").add_file()
    end,
    desc = "[H]arpoon [A]dd",
  },
  {
    "<leader>hq",
    function()
      require("harpoon.ui").toggle_quick_menu()
    end,
    desc = "[H]arpoon [Q]uickmenu",
  },
  {
    "<leader>hj",
    function()
      require("harpoon.ui").nav_next()
    end,
    desc = "[H]arpoon Next",
  },
  {
    "<leader>hk",
    function()
      require("harpoon.ui").nav_prev()
    end,
    desc = "[H]arpoon Prev",
  }
}

for _, keybind in ipairs(harpoon_keybinds) do
  vim.keymap.set('n', keybind[1], keybind[2])
end

MiniDeps.add {
  source = "tpope/vim-sleuth"
}

MiniDeps.add{
  source = 'nvim-mini/mini.completion',
  checkout = 'stable'
}

require("mini.completion").setup {
  fallback_action = '<C-y>',
  mappings = {
    scroll_down = '<C-n>',
    scroll_up = '<C-p>'
  }
}

MiniDeps.add {
  source = "comfysage/evergarden"
}

vim.cmd.colorscheme "evergarden"
