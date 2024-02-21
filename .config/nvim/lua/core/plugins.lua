require("lazy").setup({
  { "catppuccin/nvim",                 name = "catppuccin", priority = 1000 },
  "tpope/vim-commentary",
  "mattn/emmet-vim",
  -- "nvim-tree/nvim-web-devicons",
  "ellisonleao/gruvbox.nvim",
  "dracula/vim",
  "nvim-lualine/lualine.nvim",
  { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = { "nvim-treesitter/nvim-treesitter" }
  },
  "vim-test/vim-test",
  "lewis6991/gitsigns.nvim",
  "preservim/vimux",
  "christoomey/vim-tmux-navigator",
  "tpope/vim-fugitive",
  "tpope/vim-surround",
  "stevearc/oil.nvim",
  -- completion
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-nvim-lsp",
  "L3MON4D3/LuaSnip",
  "saadparwaiz1/cmp_luasnip",
  { 'L3MON4D3/LuaSnip' },
  "rafamadriz/friendly-snippets",
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "neovim/nvim-lspconfig",
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" }
  },
  -- {
  --   "vinnymeller/swagger-preview.nvim",
  --   run = "npm install -g swagger-ui-watcher",
  -- },
  -- {
  --   "iamcco/markdown-preview.nvim",
  --   run = "cd app && npm install",
  -- },
  { "nvim-treesitter/nvim-treesitter-context" },
  {
    "nvim-telescope/telescope.nvim",
    --    tag = "0.1.4",
    dependencies = { "nvim-lua/plenary.nvim" }
  },
  { "gbprod/php-enhanced-treesitter.nvim" },
  { "shortcuts/no-neck-pain.nvim" },
  -- { "folke/zen-mode.nvim" },
  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
  { "mbbill/undotree" }
})
