return {
    {
      "nvim-treesitter/nvim-treesitter",
      config = function()
        require("nvim-treesitter.configs").setup({
          ensure_installed = { "elixir", "eex", "heex" },
          highlight = { enable = true },
          indent = { enable = true },
        })
      end,
    },

    {
      "nvim-tree/nvim-web-devicons",
    },

    {
      "stevearc/oil.nvim",
      opts = {},
      dependencies = { "nvim-tree/nvim-web-devicons" },
      keys = {
        { "-", "<CMD>Oil --float<CR>", desc = "Oil file explorer", mode = "n" }
      }
    },

    {
      "nvim-lualine/lualine.nvim",
      dependencies = { "nvim-tree/nvim-web-devicons" },
      config = true
    },

    {
      "j-hui/fidget.nvim",
      opts = {},
    },

    {
      "nvim-telescope/telescope.nvim",
      event = "VimEnter",
      dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
      },
      opts = {
        pickers = {
          colorscheme = {
            enable_preview = true
          }
        }
      },
      keys = {
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
        },
      }
    },

    {
      "neovim/nvim-lspconfig",
      dependencies = {
        "j-hui/fidget.nvim",
        "saghen/blink.cmp"
      },
      init = function()
        local lsp_servers = {
          "rust_analyzer",
          "ocamllsp"
        }
        for _, server_name in ipairs(lsp_servers) do
          require("lspconfig")[server_name].setup({})
          vim.lsp.enable(server_name)
        end
      end,
      keys = {
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
    },

    {
      "ThePrimeagen/harpoon",
      dependencies = {
	"nvim-lua/plenary.nvim",
      },
      keys = {
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
  	},
      },
    },

    {
      "tpope/vim-sleuth",
      lazy = false
    },

    {
      "saghen/blink.cmp",
      opts = {
        keymap = {
          preset = "default"
        },
        sources = {
          default = { "lsp", "path", "snippets", "buffer" }
        },
        fuzzy = {
          implementation = "rust",
          prebuilt_binaries = {
            force_version = "v0.14.2"
          }
        }
      },
    },

      -- Change to a better terminal
    {
      "akinsho/toggleterm.nvim",
      config = true,
      cmd = "ToggleTerm",
      build = ":ToggleTerm",
      keys = {
        {
          "<C-\\>",
          "<cmd>ToggleTerm<cr>",
          desc = "Toggle floating terminal",
        },
        {
          "<C-\\>",
          "<cmd>ToggleTerm<cr>",
          desc = "Toggle floating terminal",
          mode = "t",
        },
      },
      opts = {
        direction = "horizontal",
        shade_filetypes = {},
        hide_numbers = true,
        insert_mappings = true,
        start_in_insert = true,
        close_on_exit = true,
        shell = vim.loop.os_uname().sysname == "Windows_NT" and "pwsh.exe" or vim.o.shell,
      },
    },

    {
      "folke/which-key.nvim",
      event = "VeryLazy",
      opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      },
      keys = {
        {
          "<leader>?",
          function()
            require("which-key").show({ global = false })
          end,
          desc = "Buffer Local Keymaps (which-key)",
        },
      },
    },

    {
      "yetone/avante.nvim",
      event = "VeryLazy",
      --lazy = false,
      version = false, -- Set this to "*" to always pull the latest release version, or set it to false to update to the latest code changes.
      opts = {
        -- add any opts here
        -- for example
        provider = "claude",
        claude = {
          model = "claude-3-7-sonnet-20250219", -- your desired model (or use gpt-4o, etc.)
          timeout = 30000, -- timeout in milliseconds
          temperature = 0, -- adjust if needed
          max_tokens = 8192,
          -- reasoning_effort = "high" -- only supported for reasoning models (o1, etc.)
        },
        hints = {
          enabled = false
        }
      },
      -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
      build = vim.fn.has('win32') and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" or "make",
      -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
      dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "stevearc/dressing.nvim",
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        --- The below dependencies are optional,
        "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
        {
          -- support for image pasting
          "HakonHarnes/img-clip.nvim",
          event = "VeryLazy",
          opts = {
            -- recommended settings
            default = {
              embed_image_as_base64 = false,
              prompt_for_file_name = false,
              drag_and_drop = {
                insert_mode = true,
              },
              -- required for Windows users
              use_absolute_path = true,
            },
          },
        },
        {
          -- Make sure to set this up properly if you have lazy=true
          'MeanderingProgrammer/render-markdown.nvim',
          opts = {
            file_types = { "markdown", "Avante" },
          },
          ft = { "markdown", "Avante" },
        },
      },
    },
}
