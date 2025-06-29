return {
  'goolord/alpha-nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' }, -- optional, for icons
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    dashboard.section.header.val = {
      " ███╗   ██╗██╗   ██╗██╗███╗   ███╗",
      " ████╗  ██║██║   ██║██║████╗ ████║",
      " ██╔██╗ ██║██║   ██║██║██╔████╔██║",
      " ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║",
      " ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║",
      " ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝",
    }

    dashboard.section.buttons.val = {
      dashboard.button("e", "  new file", ":ene <bar> startinsert <cr>"),
      dashboard.button("f", "  find file", ":telescope find_files<cr>"),
      dashboard.button("r", "  recent files", ":telescope oldfiles<cr>"),
      dashboard.button("g", "  find text", ":telescope live_grep<cr>"),
      dashboard.button("c", "  config", ":e $myvimrc<cr>"),
      dashboard.button("q", "  quit", ":qa<cr>"),
    }

    alpha.setup(dashboard.config)
  end
}

