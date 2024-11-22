return {
  { "echasnovski/mini.icons", version = "*" },
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        -- first key is the mode
        n = {
          -- second key is the lefthand side of the map
          -- mappings seen under group name "Buffer"
          [","] = { ":", desc = "enter command mode" },
          ["<Leader>gi"] = { "<cmd>Neogit kind=split<cr>", desc = "Open Neogit" },
          ["<leader>fp"] = { "<cmd>Telescope neovim-project discover<cr>", desc = "Open projects" },
          ["<leader>fu"] = { "<cmd>Telescope undo<cr>", desc = "Open undo history" },
          ["<leader>cc"] = { "<cmd>Telescope neoclip a extra=star,plus,b<cr>", desc = "Open clip manager" },
          ["<Tab>"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
          ["<S-Tab>"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },
          ["<M-t>"] = { ":tabnew<CR>", desc = "Open new tab" },
          ["<M-d>"] = { ":tabclose<CR>", desc = "Close current tab" },
          ["<M-n>"] = { ":tabnext<CR>", desc = "Next tab" },
          ["<M-p>"] = { ":tabnext<CR>", desc = "Previous tab" },
          ["<M-z>"] = { ":NeoZoom<CR>", desc = "Zoom to split" },
          ["<Leader>lg"] = { "<Plug>(GitLabToggleCodeSuggestions)", desc = "Toggle GitLabToggleCodeSuggestions" },
          ["<leader>cb"] = { ":Telescope keymaps<CR>", desc = "Search keybindings" },
          ["<leader>no"] = { function() require("notion").openMenu() end, desc = "Notion menu" },
          ["<Leader>bD"] = {
            function()
              require("astroui.status").heirline.buffer_picker(
                function(bufnr) require("astrocore.buffer").close(bufnr) end
              )
            end,
            desc = "Pick to close",
          },
          -- tables with just a `desc` key will be registered with which-key if it's installed
          -- this is useful for naming menus
          ["<Leader>b"] = { desc = "Buffers" },
          -- quick save
          ["<C-s>"] = { ":w!<cr>", desc = "Save File" }, -- change description but the same command
        },
        t = {
          ["<Leader><Esc>"] = { "<C-\\><C-n>", desc = "Exit terminal mode" },
          -- setting a mapping to false will disable it
          -- ["<esc>"] = false,
        },
      },
    },
  },
  {
    "AstroNvim/astrolsp",
    ---@type AstroLSPOpts
    opts = {
      mappings = {
        n = {
          -- this mapping will only be set in buffers with an LSP attached
          K = {
            function() vim.lsp.buf.hover() end,
            desc = "Hover symbol details",
          },
          -- condition for only server with declaration capabilities
          gD = {
            function() vim.lsp.buf.declaration() end,
            desc = "Declaration of current symbol",
            cond = "textDocument/declaration",
          },
        },
      },
    },
  },
}
