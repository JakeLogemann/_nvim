" My Keybinding Configuration
"
" Maintainer:	Jake Logemann <jake.logemann@gmail.com>
"
" vim: fdm=marker

function! dotfiles#keybinds#init() 
  call dotfiles#keybinds#normal()
  call dotfiles#keybinds#terminal()
  call dotfiles#keybinds#leader()
endfunction

function! dotfiles#keybinds#reload()
  let l:filename = expand(g:dotfiles_vim_config_dir) . "/which_key.json"
  let g:my_which_key_json = json_decode(readfile(l:filename))
endfunction

function! dotfiles#keybinds#edit()
  execute printf("tabedit %s", expand(g:dotfiles_vim_config_dir) . "/which_key.json")
endfunction

function! dotfiles#keybinds#normal() 
  "nnoremap                <c-h>           :SidewaysLeft<cr>
  "nnoremap                <c-l>           :SidewaysRight<cr>
  nnoremap <silent>       <C-s>           :write<cr>
  nnoremap <silent>       <Esc><Esc>      :noh<cr>
endfunction

function! dotfiles#keybinds#terminal() 
  tnoremap                <Esc><Esc>      <C-\><C-n>
endfunction

function! dotfiles#keybinds#leader() 
  " WhichKey-specific keybinds 
  nnoremap <silent>       <leader>        :<C-U>WhichKey! g:my_which_key_json.normal<CR>
  nnoremap <silent>       <localleader>   :<C-U>WhichKey! g:my_which_key_json.normal<CR>
  vnoremap <silent>       <leader>        :<C-U>WhichKeyVisual! g:my_which_key_json.visual<CR>
  vnoremap <silent>       <localleader>   :<C-U>WhichKeyVisual! g:my_which_key_json.visual<CR>
  " General configuration for "vim-which-key".
  let g:WhichKeyFormatFunc               = function('which_key#util#format')
  let g:which_key_align_by_seperator     = 1
  let g:which_key_default_group_name     = '.'
  let g:which_key_display_names          = {'<CR>': '↵', '<TAB>': '→'}
  let g:which_key_fallback_to_native_key = 1
  let g:which_key_flatten                = 1
  let g:which_key_floating_relative_win  = 0
  let g:which_key_hspace                 = 6
  let g:which_key_run_map_on_popup       = 0
  let g:which_key_sep                    = '‣'
  let g:which_key_sort_horizontal        = 0
  let g:which_key_timeout                = &timeoutlen
  let g:which_key_use_floating_win       = 0
  let g:which_key_vertical               = 0
  let g:which_key_disable_default_offset = 0
  " Load the definition from JSON separately for easier reloading.
  call dotfiles#keybinds#reload()
endfunction