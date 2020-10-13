package.loaded['vimrc.commands'] = nil -- always reload this file on require()
require('vimp') -- vimpeccable, not vim.api
local util = require('vimrc.util')

vimp.map_command('SvOpenFileOnGithub', function()
  print("Todo - Open the URL on github for current file on current line")
end)

vimp.map_command('DeleteFile', function() vim.cmd('silent !rm -f %') end)

vimp.map_command('SvRename', function(newName)
  print("Todo - rename current file to " .. newName)
end)

vimp.map_command('ReloadLuaVimrc', function()
  -- Remove all previously added vimpeccable maps
  vimp.unmap_all()
  -- Unload the lua namespace so that the next time require('vimrc') or
  -- require('vimrc.X') is called it will reload the file By default, require()
  -- will only load the lua file the first time it is called and thereafter
  -- pull it from a cache.
  util.unload_lua_namespace('vimrc')
  -- Make sure all open buffers are saved
  vim.cmd('silent wa')
  -- Execute our vimrc lua file again to add back our maps
  require('vimrc')

  print("Reloaded vimrc!")
end)

vim.cmd [[ command! -nargs=1 -complete=file TabView tab sview +setlocal\ nomodifiable <args> ]]
vim.cmd [[ command! -nargs=1 -complete=file DE tabedit <args> ]]
vim.cmd [[ command! -nargs=1 -complete=help Vhelp vertical help <args> ]]
vim.cmd [[ command! -nargs=1 -complete=help Thelp tab help <args> ]]
