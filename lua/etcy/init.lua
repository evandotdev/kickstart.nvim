-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- navigate around wrapped lines
vim.keymap.set('n', 'k', 'gk')
vim.keymap.set('n', 'j', 'gj')
-- allow single line travel when lines visually wrap
if vim.g.vscode then
  -- set scroll=10 <- being overridden by something so set 10 manually here
  -- FIXME doesn't work atm
  vim.keymap.set('n', '<C-d>', '10<C-d>zz')
  vim.keymap.set('n', '<C-u>', '10<C-u>zz')
  vim.keymap.set('n', 'n', 'nzzzv', opts)
  vim.keymap.set('n', 'N', 'Nzzzv', opts)
  -- Harpoon
  vim.keymap.set('n', '<leader>ha', "<Cmd>call VSCodeNotify('vscode-harpoon.addEditor')<CR>", { desc = '[h]arpoon [a]dd' })
  vim.keymap.set('n', '<leader>hs', "<Cmd>call VSCodeNotify('vscode-harpoon.editorQuickPick')<CR>", { desc = '[h]arpoon [s]how' })
  vim.keymap.set('n', '<leader>he', "<Cmd>call VSCodeNotify('vscode-harpoon.editEditors')<CR>", { desc = '[h]arpoon [e]dit' })
  -- not really sure what this does atm
  -- vim.keymap.set('n', '<leader>ht', "<cmd>lua require('harpoon.cmd-ui').toggle_quick_menu()<cr>", { desc = '[h]arpoon [t]oggle' })
  vim.keymap.set('n', '<A-1>', "<Cmd>call VSCodeNotify('vscode-harpoon.gotoEditor1')<CR>")
  vim.keymap.set('n', '<A-2>', "<Cmd>call VSCodeNotify('vscode-harpoon.gotoEditor2')<CR>")
  vim.keymap.set('n', '<A-3>', "<Cmd>call VSCodeNotify('vscode-harpoon.gotoEditor3')<CR>")
  vim.keymap.set('n', '<A-4>', "<Cmd>call VSCodeNotify('vscode-harpoon.gotoEditor4')<CR>")

  -- move hightlighted text up/down
  vim.keymap.set('n', '<leader>j', ':m .+1<CR>==', opts)
  vim.keymap.set('n', '<leader>k', ':m .-2<CR>==', opts)
  -- navigate around wrapped lines ALWAYS
  vim.keymap.set('n', '<leader>s', "<Cmd>call VSCodeNotify('leap.findForward')<CR>")
  vim.keymap.set('n', '<leader>S', "<Cmd>call VSCodeNotify('leap.findBackward')<CR>")
  vim.keymap.set('n', '<leader>lm', "<Cmd>call VSCodeNotify('leap.match-case')<CR>")
  vim.keymap.set('n', 'k', "<Cmd>call VSCodeNotify('cursorMove', { 'to': 'up', 'by': 'wrappedLine', 'value': v:count1 })<CR>")
  vim.keymap.set('n', 'j', "<Cmd>call VSCodeNotify('cursorMove', { 'to': 'down', 'by': 'wrappedLine', 'value': v:count1 })<CR>")

  -- navigate classes / methods
  -- NOTE for some reason can't really get same "[[", "]]" behaviour from ideavim
  vim.keymap.set('n', "<c-'>", '<cmd>call VSCodeNotify("gotoNextPreviousMember.nextMember")<CR>')
  vim.keymap.set('n', '<c-;>', '<cmd>call VSCodeNotify("gotoNextPreviousMember.previousMember")<CR>')
  -- navigate buffer
  vim.keymap.set('n', '<tab>', '<cmd>call VSCodeNotify("workbench.action.nextEditor")<CR>')
  vim.keymap.set('n', '<s-tab>', '<cmd>call VSCodeNotify("workbench.action.previousEditor")<CR>')

  -- shifting lines in visual mode
  vim.keymap.set('x', 'K', ":move '<-2<CR>gv-gv")
  vim.keymap.set('x', 'J', ":move '>+1<CR>gv-gv")

  -- split navigation
  vim.keymap.set('n', 'sh', '<cmd>call VSCodeNotify("workbench.action.navigateLeft")<CR>')
  vim.keymap.set('n', 'sj', '<cmd>call VSCodeNotify("workbench.action.navigateDown")<CR>')
  vim.keymap.set('n', 'sk', '<cmd>call VSCodeNotify("workbench.action.navigateUp")<CR>')
  vim.keymap.set('n', 'sl', '<cmd>call VSCodeNotify("workbench.action.navigateRight")<CR>')

  -- split window management
  vim.keymap.set('n', 'ss', '<cmd>call VSCodeNotify("workbench.action.splitEditorDown")<cr>', { silent = true, desc = '[s]plit s??' })
  vim.keymap.set('n', 'sv', '<cmd>call VSCodeNotify("workbench.action.splitEditorRight")<cr>', { silent = true, desc = '[s]plit [v]ertically' })
  vim.keymap.set(
    'n',
    'sc',
    '<cmd>call VSCodeNotify("workbench.action.closeEditorsInOtherGroups")<cr>',
    { silent = true, desc = '[s]plit [c]lose, all other splits but active split' }
  )

  -- nvim-tree
  vim.keymap.set('n', '<c-n>', '<cmd>call VSCodeNotify("workbench.action.toggleSidebarVisibility")<cr>', { silent = true })

  -- telescope
  vim.keymap.set('n', '<leader>ff', '<cmd>call VSCodeNotify("workbench.action.quickOpen")<cr>', { silent = true })
  vim.keymap.set('n', '<leader>fg', '<cmd>call VSCodeNotify("search.action.openEditor", { "query": expand("<cword>")})<cr>', { silent = true })
  vim.keymap.set('n', '<leader>fo', '<cmd>call VSCodeNotify("workbench.action.openRecent")<cr>', { silent = true })

  -- Comment.nvim
  vim.keymap.set('n', 'gcc', '<cmd>call VSCodeNotify("editor.action.commentLine")<cr>', { desc = 'Normal mode line comment' })
  vim.keymap.set('x', 'gc', '<cmd>call VSCodeNotify("editor.action.commentLine", 0)<cr>', { desc = 'Visual mode line comment' })
  vim.keymap.set('n', 'gbc', '<cmd>call VSCodeNotify("editor.action.blockComment")<cr>', { desc = 'Normal mode block comment' })
  vim.keymap.set('x', 'gb', '<cmd>call VSCodeNotify("editor.action.blockComment", 0)<cr>', { desc = 'Visual mode block comment' })

  -- EXTRAS
  vim.keymap.set('n', '<leader>', '<Nop>')
  vim.keymap.set('x', '<leader>', '<Nop>')

  -- NOTE LSP, see lsp.lua
  vim.keymap.set('n', 'K', '<cmd>call VSCodeNotify("editor.action.showHover")<cr>', { desc = 'Show Hover' })
  vim.keymap.set('n', 'gr', '<cmd>call VSCodeNotify("editor.action.referenceSearch.trigger")<cr>', { desc = '[G]oto [r]eferences' })
  vim.keymap.set('n', 'gd', '<cmd>call VSCodeNotify("editor.action.peekDefinition")<cr>', { desc = ' [ G]oto [d]efinition' })
  vim.keymap.set('n', 'gD', '<cmd>call VSCodeNotify("editor.action.peekDeclaration")<cr>', { desc = ' [ G]oto [D]eclaration' })
  vim.keymap.set('n', 'gt', '<cmd>call VSCodeNotify("editor.action.peekTypeDefinition")<cr>', { desc = ' [ G]oto [t]ype definition' })
  vim.keymap.set('n', 'gi', '<cmd>call VSCodeNotify("editor.action.peekImplementation")<cr>', { desc = ' [ G]oto [i]mplementation' })
  -- vim.keymap.set('n', '<c-h>', '<cmd>call VSCodeNotify("editor.action.showHover")<cr>', { desc = ' Show signature [h]elp' })
  -- vim.keymap.set('n', '<space>rn', '<cmd>call VSCodeNotify("editor.action.showHover")<cr>', { desc = ' [ r]e[n]ame' })
  -- vim.keymap.set({ 'x' }, '<space>ca', '<cmd>call VSCodeNotify("editor.action.showHover")<cr>', { desc = '[c]ode [a]ctions' })
  vim.keymap.set('n', '<space>fm', '<cmd>call VSCodeNotify("editor.action.formatSelection", 0)<cr>', { desc = '[f]or[m]at' })

  -- diagnostics
  vim.keymap.set('n', '[d', '<cmd>call VSCodeNotify("editor.action.marker.prev")<cr>', { desc = 'Goto prev [d]iagnostic' })
  vim.keymap.set('n', ']d', '<cmd>call VSCodeNotify("editor.action.marker.next")<cr>', { desc = 'Goto next [d]iagnostic' })
  vim.keymap.set('n', '[c', '<cmd>call VSCodeNotify("workbench.action.editor.previousChange")<cr>', { desc = 'Goto prev [c]hange' })
  vim.keymap.set('n', ']c', '<cmd>call VSCodeNotify("workbench.action.editor.nextChange")<cr>', { desc = 'Goto next [c]hange' })

  -- Trouble
  vim.keymap.set('n', '<leader>t', '<cmd>call VSCodeNotify("workbench.actions.view.problems")<cr>', { desc = 'Focus on problems' })

  -- FIXME why format not working
  vim.keymap.set('n', '<leader>fm', '<cmd>call VSCodeNotify("editor.action.formatSelection")<cr>', { desc = '[F]or[m]at selection' })
  vim.keymap.set('n', '<leader>fb', '<cmd>call VSCodeNotify("workbench.action.showAllEditors")<cr>', { desc = 'Show all open editors' })
  -- vim.keymap.set('n', '<leader>fh', function()
  --     require('telescope.builtin').help_tags()
  -- end)
  vim.keymap.set('n', '<leader>fd', '<cmd>call VSCodeNotify("workbench.action.problems.focus")<cr>', { desc = 'Focus on problems' })
  -- vim.keymap.set('n', '<leader>/', function()
  --     require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown({
  --         previewer = true,
  --     }))
  -- end, { desc = '[/] Fuzzily search in current buffer' })

  -- navigate TODO items
  vim.keymap.set('n', ']t', '<cmd>call VSCodeNotify("todo-tree.goToNext")<cr>', { desc = 'Goto next [T]ODO' })
  vim.keymap.set('n', '[t', '<cmd>call VSCodeNotify("todo-tree.goToPrevious")<cr>', { desc = 'Goto previous [T]ODO' })

  return
end

_G.custom_ignore_filetypes = {
  'dirbuf',
  'dirvish',
  'fugitive',
  'TelescopePrompt',
  'spectre_panel',
  'snacks_picker_input',
  'oil',
}

local source_env_vars = function()
  local handle = io.popen 'EDITOR=cat sops -d ~/.openrouter-api-key.enc 2>/dev/null'
  local openrouter_result = handle and handle:read '*a' or ''
  if handle then
    handle:close()
  end

  local handle = io.popen 'EDITOR=cat sops -d ~/.anthropic-api-key.enc 2>/dev/null'
  local anthropic_result = handle and handle:read '*a' or ''
  if handle then
    handle:close()
  end

  vim.env.OPENAI_API_KEY = openrouter_result:match 'OPENROUTER_API_KEY=(%S+)'
  vim.env.ANTHROPIC_API_KEY = anthropic_result:match 'ANTHROPIC_API_KEY=(%S+)'
  vim.env.OPENROUTER_API_KEY = openrouter_result:match 'OPENROUTER_API_KEY=(%S+)'
end

source_env_vars()

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { 'Failed to clone lazy.nvim:\n', 'ErrorMsg' },
      { out, 'WarningMsg' },
      { '\nPress any key to exit...' },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require('lazy').setup {
  spec = {
    -- import your plugins
    { import = 'etcy.lazy_plugins' },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  -- automatically check for plugin updates
  checker = { enabled = false },
  change_detection = {
    enabled = true,
    notify = false,
  },
}

require 'etcy.autocmd'
require 'etcy.opt'
require 'etcy.set'
-- Close all but current buffer
vim.api.nvim_create_user_command('CloseAllButCurrent', function()
  vim.cmd [[%bd|e#|bd#]]
end, {})

-- Quick fix stuff
vim.api.nvim_create_user_command('QuickFixClear', function()
  vim.fn.setqflist({}, 'r')
end, {})

vim.api.nvim_create_user_command('QuickFixUndo', function()
  vim.cmd [[cdo :norm! u]]
end, {})

vim.api.nvim_create_user_command('ClearMarks', function()
  vim.cmd [[delmarks! | delmarks A-Z0-9]]
end, { desc = 'Clear all marks' })
