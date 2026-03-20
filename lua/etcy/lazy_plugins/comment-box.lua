return {
  {
    'LudoPinelli/comment-box.nvim',
    keys = {
      { '<leader>cb', '<Cmd>CBccbox<CR>', desc = 'Comment box' },
      { '<leader>ct', '<Cmd>CBllline<CR>', desc = 'Titled line' },
      { '<leader>cl', '<Cmd>CBline<CR>', desc = 'Simple line' },
      { '<leader>cm', '<Cmd>CBllbox<CR>', desc = 'Marked comment box' },
      { '<leader>cd', '<Cmd>CBd<CR>', desc = 'Remove comment box' },
    },
    opts = {
      doc_width = 80,
      box_width = 60,
      borders = {
        top = "─",
        bottom = "─",
        left = "│",
        right = "│",
        top_left = "╭",
        top_right = "╮",
        bottom_left = "╰",
        bottom_right = "╯",
      },
      line_width = 70,
      lines = {
        line = "─",
        line_start = "─",
        line_end = "─",
        title_left = "─",
        title_right = "─",
      },
    },
  },
}