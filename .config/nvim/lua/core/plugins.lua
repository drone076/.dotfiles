require("lazy").setup({
  { "catppuccin/nvim",                 name = "catppuccin", priority = 1000 },
  "tpope/vim-commentary",
  "mattn/emmet-vim",
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
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" }
  },
  { "nvim-treesitter/nvim-treesitter-context" },
  {
    "nvim-telescope/telescope.nvim",
    --    tag = "0.1.4",
    dependencies = { "nvim-lua/plenary.nvim" }
  },
  { "gbprod/php-enhanced-treesitter.nvim" },
  { "shortcuts/no-neck-pain.nvim" },
  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
  { "mbbill/undotree" }
})
