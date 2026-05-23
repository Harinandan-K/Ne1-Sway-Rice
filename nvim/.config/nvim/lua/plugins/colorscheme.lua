return {
  -- 1. Download the specific Cyberpunk-Neon Neovim theme
  {
    "ingenarel/cyberpunk-neon.nvim",
    lazy = false,
    priority = 1000,
  },

  -- 2. Set it as the default LazyVim theme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "cyberpunk-neon",
    },
  },
}
