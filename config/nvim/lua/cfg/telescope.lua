return function ()
  require'telescope'.setup{
    defaults = {
      mappings = {
        i = {
          ['<c-j>'] = 'move_selection_next',
          ['<c-k>'] = 'move_selection_previous'
        }
      }
    },
    pickers = {
      buffers = {
        mappings = {
          i = {
            ['<c-d>'] = 'delete_buffer',
          },
          n = {
            ['<c-d>'] = 'delete_buffer',
          }
        }
      },
      git_branches = {
        mappings = {
          i = {
            ['<c-d>'] = 'git_delete_branch'
          },
          n = {
            ['<c-d>'] = 'git_delete_branch'
          }
        },
        theme = 'dropdown'
      },
      git_commits = {
        theme = 'dropdown'
      },
      help_tags = {
        theme = 'dropdown'
      },
      live_grep = {
	theme = 'dropdown'
      },
      treesitter = {
        theme = 'dropdown'
      },
    }
  }

  local opts = { noremap = true, silent = true }

  vim.api.nvim_set_keymap('n', '<c-n>', '<cmd>Telescope find_files<cr>', opts)
  vim.api.nvim_set_keymap('n', '<c-e>', '<cmd>Telescope buffers<cr>', opts)

  vim.api.nvim_set_keymap('n', '<space><f12>', '<cmd>Telescope treesitter<cr>', opts)
  vim.api.nvim_set_keymap('n', '<leader>ts', '<cmd>Telescope treesitter<cr>', opts)

  vim.api.nvim_set_keymap('n', '<leader>h', [[<cmd>lua require'telescope.builtin'.help_tags()<cr>]], opts)
  vim.api.nvim_set_keymap('n', '<leader>lg', [[<cmd>lua require'telescope.builtin'.live_grep()<cr>]], opts)

  vim.api.nvim_set_keymap('n', '<leader><leader>', [[<cmd>lua require'telescope.builtin'.git_files()<cr>]], opts)
  vim.api.nvim_set_keymap('n', '<leader>gl', [[<cmd>lua require'telescope.builtin'.git_commits()<cr>]], opts)

  local config = vim.fn.stdpath('config')
  vim.api.nvim_set_keymap('n', '<leader>ev', '<cmd>Telescope find_files cwd='..config..'<cr>', opts)
end
