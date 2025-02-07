local map = vim.keymap.set

-- Interactive mode
map("i", "<C-b>", "<ESC>^i", { desc = "move beginning of line" })
map("i", "<C-e>", "<End>", { desc = "move end of line" })
map("i", "<C-h>", "<Left>", { desc = "move left" })
map("i", "<C-l>", "<Right>", { desc = "move right" })
map("i", "<C-j>", "<Down>", { desc = "move down" })
map("i", "<C-k>", "<Up>", { desc = "move up" })

-- Pane and Window Navigation
map("n", "<C-h>", "<C-w>h", { desc = "navigate left" })
map("n", "<C-j>", "<C-w>j", { desc = "navigate down" })
map("n", "<C-k>", "<C-w>k", { desc = "navigate up" })
map("n", "<C-l>", "<C-w>l", { desc = "navigate right" })
map("t", "<C-h>", "<Cmd>wincmd h<CR>", { desc = "navigate left" })
map("t", "<C-j>", "<Cmd>wincmd j<CR>", { desc = "navigate down" })
map("t", "<C-k>", "<Cmd>wincmd k<CR>", { desc = "navigate up" })
map("t", "<C-l>", "<Cmd>wincmd l<CR>", { desc = "navigate right" })
map("n", "<C-h>", "<Cmd>TmuxNavigateLeft<CR>", { desc = "navigate left" })
map("n", "<C-j>", "<Cmd>TmuxNavigateDown<CR>", { desc = "navigate down" })
map("n", "<C-k>", "<Cmd>TmuxNavigateUp<CR>", { desc = "navigate up" })
map("n", "<C-l>", "<Cmd>TmuxNavigateRight<CR>", { desc = "navigate left" })

-- Clear highlights
map("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights" })

-- Copy full file
map("n", "<C-y>", "<cmd>%y+<CR>", { desc = "general copy whole file" })

-- Line numbers
map("n", "<leader>n", "<cmd>set nu!<CR>", { desc = "toggle line number" })
map("n", "<leader>rn", "<cmd>set rnu!<CR>", { desc = "toggle relative number" })

-- Cheatsheet
map("n", "<leader>ch", "<cmd>NvCheatsheet<CR>", { desc = "toggle nvcheatsheet" })

-- Format
map("n", "<leader>fm", function()
  require("conform").format { lsp_fallback = true }
end, { desc = "general format file" })

-- Global lsp mappings
map("n", "<leader>ds", vim.diagnostic.setloclist, { desc = "LSP diagnostic loclist" })

-- New tab
map("n", "<leader>b", "<cmd>enew<CR>", { desc = "buffer new" })

-- Buffer navigation
map("n", "<tab>", function()
  require("nvchad.tabufline").next()
end, { desc = "buffer goto next" })
map("n", "<S-tab>", function()
  require("nvchad.tabufline").prev()
end, { desc = "buffer goto prev" })
map("n", "<C-x>", function()
  require("nvchad.tabufline").close_buffer()
end, { desc = "buffer close" })

-- Comment
map("n", "<C-_>", "gcc", { desc = "toggle comment", remap = true })
map("v", "<C-_>", "gc", { desc = "toggle comment", remap = true })

-- nvimtree
map("n", "<leader>m", "<cmd>NvimTreeFocus<CR>", { desc = "nvimtree focus window" })
map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })

-- telescope
map("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", { desc = "telescope live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "telescope find buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "telescope help page" })
map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "telescope find oldfiles" })
map("n", "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "telescope find in current buffer" })
map("n", "<leader>cm", "<cmd>Telescope git_commits<CR>", { desc = "telescope git commits" })
map("n", "<leader>gt", "<cmd>Telescope git_status<CR>", { desc = "telescope git status" })
map("n", "<leader>pt", "<cmd>Telescope terms<CR>", { desc = "telescope pick hidden term" })
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "telescope find files" })
map(
  "n",
  "<leader>fa",
  "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
  { desc = "telescope find all files" }
)

-- themes
map("n", "<leader>th", function()
  require("nvchad.themes").open()
end, { desc = "telescope nvchad themes" })

-- terminal
map("t", "<C-x>", "<C-\\><C-N>", { desc = "terminal escape terminal mode" })

-- new terminals
map("n", "<leader>h", function()
  require("nvchad.term").new { pos = "sp" }
end, { desc = "terminal new horizontal term" })
map("n", "<leader>v", function()
  require("nvchad.term").new { pos = "vsp" }
end, { desc = "terminal new vertical tevm" })

-- toggleable
map({ "n", "t" }, "<A-v>", function()
  require("nvchad.term").toggle { pos = "vsp", id = "vtoggleTerm" }
end, { desc = "terminal toggleable vertical term" })
map({ "n", "t" }, "<A-h>", function()
  require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm" }
end, { desc = "terminal toggleable horizontal term" })
map({ "n", "t" }, "<A-i>", function()
  require("nvchad.term").toggle { pos = "float", id = "floatTerm" }
end, { desc = "terminal toggle floating term" })

-- whichkey
map("n", "<leader>wK", "<cmd>WhichKey <CR>", { desc = "whichkey all keymaps" })
map("n", "<leader>wk", function()
  vim.cmd("WhichKey " .. vim.fn.input "WhichKey: ")
end, { desc = "whichkey query lookup" })

-- Custom Mappings:
-- <leader>wi"w	Wraps the next word in double quotes ("word")
-- <leader>wi'$	Wraps from the cursor to end of line in single quotes ('hello world')
-- <leader>wi[]w	Wraps the next word in square brackets ([word])
-- <leader>wi{}ap	Wraps an entire paragraph in curly braces
function WrapIn()
  local char = vim.fn.nr2char(vim.fn.getchar()) -- Get wrapping character
  local motion = vim.fn.nr2char(vim.fn.getchar()) -- Get selection motion

  -- Enter visual mode, apply motion
  vim.cmd("normal! v" .. motion)

  -- Add the character before and after selection
  vim.cmd("normal! `<i" .. char)
  vim.cmd("normal! `>a" .. char)
end

vim.api.nvim_set_keymap("n", "<leader>wi", ":lua WrapIn()<CR>", { noremap = true, silent = true })
