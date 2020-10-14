local M = { plugins = {} }

vim.env.GIT_ASKPASS = "true"

vim.api.nvim_set_var('libmodalTimeouts', true) -- define modal timeouts; avoid a bug in libmodal!

_G['dbg'] = function(...) print(unpack(vim.tbl_map(vim.inspect, {...}))) end
_G['log'] = require('vimrc/log')
_G['json'] = require('vimrc/json')
_G['vimp'] = require('vimp')
_G['libmodal'] = require('libmodal')
_G['plenary'] = require('plenary')
_G['bufferline'] = require('bufferline')
_G['devicons'] = require('nvim-web-devicons')
_G['colorbuddy'] = require('colorbuddy')

devicons.setup()

require('vimrc/options')
require('vimrc/mappings')
require('vimrc/packages')
require('vimrc/commands')
require('vimrc/statusline')
require('vimrc/lsp')

M.diags = require('vimrc/diags')
M.plugins.telescope = require('vimrc/plugins/telescope')
M.plugins.libmodal = require('vimrc/plugins/libmodal')

-- require('vimrc.rocks')
require('vimrc/ft/lua')
M.plugins.wordy = require('vimrc/plugins/wordy')
M.plugins.colorbuddy = require('vimrc/plugins/colorbuddy')
M.plugins.dirvish = require('vimrc/plugins/dirvish')
M.plugins.gutentags = require('vimrc/plugins/gutentags')
M.plugins.rust = require('vimrc/plugins/rust')


_G['vimrc'] = M  -- bind globally as "vimrc".
return M -- return the module (allows require()s)
