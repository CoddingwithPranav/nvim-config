-- return {
--   "nvim-tree/nvim-tree.lua",
--   dependencies = "nvim-tree/nvim-web-devicons",
--   config = function()
--     local nvimtree = require("nvim-tree")
--
--     -- recommended settings from nvim-tree documentation
--     vim.g.loaded_netrw = 1
--     vim.g.loaded_netrwPlugin = 1
--
--     nvimtree.setup({
--       view = {
--         width = 35,
--         relativenumber = true,
--       },
--       -- change folder arrow icons
--       renderer = {
--         indent_markers = {
--           enable = true,
--         },
--         icons = {
--           glyphs = {
--             folder = {
--               arrow_closed = "", -- arrow when folder is closed
--               arrow_open = "", -- arrow when folder is open
--             },
--           },
--         },
--       },
--       -- disable window_picker for
--       -- explorer to work well with
--       -- window splits
--       actions = {
--         open_file = {
--           window_picker = {
--             enable = false,
--           },
--         },
--       },
--       filters = {
--         custom = { ".DS_Store" },
--       },
--       git = {
--         ignore = false,
--       },
--     })
--
--     -- set keymaps
--     local keymap = vim.keymap -- for conciseness
--
--     keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" }) -- toggle file explorer
--     keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer on current file" }) -- toggle file explorer on current file
--     keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" }) -- collapse file explorer
--     keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" }) -- refresh file explorer
--   end
-- }
return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- Adds file icons for better readability
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '<leader>ee', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
    { '<leader>ec', ':Neotree close<CR>', desc = 'NeoTree close', silent = true }, -- Quickly close NeoTree
    { '<leader>ef', ':Neotree focus<CR>', desc = 'NeoTree focus', silent = true }, -- Focus NeoTree
  },
  opts = {
    filesystem = {
      follow_current_file = true, -- Automatically focuses on the file in the current buffer
      hijack_netrw_behavior = 'open_default', -- Disables default file explorer (netrw) and uses NeoTree
      filtered_items = {
        visible = false, -- Hide hidden files by default
        hide_dotfiles = true,
        hide_gitignored = true,
      },
      window = {
        width = 35, -- Set NeoTree window width for more space
        mappings = {
          ['\\'] = 'close_window',
          ['l'] = 'open',         -- Press `l` to open files (Vim file explorer convention)
          ['h'] = 'close_node',   -- Press `h` to close directories
        },
      },
    },
    git_status = {
      window = {
        position = 'float',       -- Opens git status window as a floating window
        mappings = {
          ['g'] = 'refresh',      -- Refresh Git status with `g`
          ['<CR>'] = 'open',      -- Open file with Enter
        },
      },
    },
  },

}

