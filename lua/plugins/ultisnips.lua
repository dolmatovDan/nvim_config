return {
  {
    "SirVer/ultisnips",
    config = function ()
      vim.g.UltiSnipsEditSplit="vertical"
      vim.g.UltiSnipsExpandTrigger = "<TAB>"
      vim.g.UltiSnipsJumpForwardTrigger = "<TAB>"
      vim.g.UltiSnipsJumpBackwardTrigger = "<S-TAB>"
      vim.g.UltiSnipsSnippetDirectories = {"UltiSnips"}
    end
  },
}
