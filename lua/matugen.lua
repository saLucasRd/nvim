 local M = {}

function M.setup()
  require('base16-colorscheme').setup({
    base00 = '#252623',
    base01 = '#2f312c',
    base02 = '#393c36',
    base03 = '#6c706b',
    base04 = '#8fb573',
    base05 = '#f1e9d2',
    base06 = '#f1e9d2',
    base07 = '#f1e9d2',
    base08 = '#e75a7c',
    base09 = '#ff9966',
    base0A = '#57a5e5',
    base0B = '#8fb573',
    base0C = '#ffaa80',
    base0D = '#b9e996',
    base0E = '#91c4ee',
    base0F = '#870726',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  hi('TelescopeNormal',         { fg = '#f1e9d2',          bg = '#252623' })
  hi('TelescopeBorder',         { fg = '#6c706b',             bg = '#252623' })
  hi('TelescopePromptNormal',   { fg = '#f1e9d2',          bg = '#252623' })
  hi('TelescopePromptBorder',   { fg = '#6c706b',             bg = '#252623' })
  hi('TelescopePromptPrefix',   { fg = '#8fb573',             bg = '#252623' })
  hi('TelescopePromptCounter',  { fg = '#8fb573',  bg = '#252623' })
  hi('TelescopePromptTitle',    { fg = '#252623',             bg = '#8fb573' })
  hi('TelescopePreviewTitle',   { fg = '#252623',             bg = '#57a5e5' })
  hi('TelescopeResultsTitle',   { fg = '#252623',             bg = '#ff9966' })
  hi('TelescopeSelection',      { fg = '#f1e9d2',          bg = '#393c36' })
  hi('TelescopeSelectionCaret', { fg = '#8fb573',             bg = '#393c36' })
  hi('TelescopeMatching',       { fg = '#8fb573',             bold = true })
end

 -- Register a signal handler for SIGUSR1 (matugen updates)
 local signal = vim.uv.new_signal()
 signal:start(
   'sigusr1',
   vim.schedule_wrap(function()
     package.loaded['matugen'] = nil
     require('matugen').setup()
   end)
 )

 return M
