vim.env.GIT_ASKPASS = "true"
vim.api.nvim_set_var('libmodalTimeouts', true) -- define modal timeouts; avoid a bug in libmodal!
require'vimrc/util'     -- keep first.
require'vimrc/options'  -- keep second.
require'vimrc/packages'

-- Require Core Components First

-- Require Other Internal Components
require'vimrc/mappings'
require'vimrc/commands'
require'vimrc/statusline'
require'vimrc/lsp'
require'vimrc/find' -- "fuzzy finder" components
require'vimrc/modals'
require'vimrc/apis'
require'vimrc/autocommands'
require'vimrc/plugins'
-- require('vimrc.rocks')
require'vimrc/ft'       -- keep third.
require'vimrc/colors'

-- Global Library Setup Functions
require'terminal'.setup{}
require'surround'.setup{}
require'nvim-web-devicons'.setup{}

-- Dumps debug information about a given variable list of var(s).
-- @param params arbitrary params to output
_G.dbg = function(...) print(unpack(vim.tbl_map(pp.dump, {...}))) end

-- Global Libraries
_G.libmodal = require'libmodal'
_G.impromptu = require'impromptu'
_G.log = require'vimrc/vendored/log'
_G.lush = require'vimrc/vendored/lush'
_G.packer = require'packer'
_G.pl = require'pl.import_into'()
_G.pl.stringx.import() -- make all strings awesome.
_G.plenary = require'plenary'
_G.pp = require'vimrc/vendored/serpent'
-- _G.tree = require'tree'
_G.vimrc = (_G.vimrc or {  })

_G.vimrc.log = require('vlog').new { plugin = 'vimrc' }

return vimrc -- still return the module (allows require()s)
