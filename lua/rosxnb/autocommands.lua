-- list filetypes in vim
-- $ cd "$(vim -Nesc '!echo $VIMRUNTIME' -c qa)"
-- $ find syntax ftplugin -iname '*.vim' -exec basename -s .vim {} + | sort -u

-- vim.opt.formatoptions:remove({"c","r","o"})          -- don't insert current comment leader automatically
vim.cmd [[ autocmd BufEnter * set fo-=r fo-=o fo-=c ]]

vim.cmd [[
  augroup _general_settings
    autocmd!
    autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR> 
    autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Visual', timeout = 200}) 
    autocmd BufWinEnter * :set formatoptions-=cro
    autocmd FileType qf set nobuflisted
  augroup end

  augroup _markdown
    autocmd!
    autocmd FileType markdown setlocal wrap spell
  augroup end

  augroup _webdev
    autocmd!
    autocmd FileType html,css,sass,scss setlocal ts=2 sts=2 sw=2
    autocmd FileType javascript,javascript,javascriptreact setlocal ts=2 sts=2 sw=2
    autocmd FileType typescript,typescriptcommon,typescriptreact setlocal ts=2 sts=2 sw=2
  augroup end

  augroup _auto_resize
    autocmd!
    autocmd VimResized * tabdo wincmd = 
  augroup end

  augroup transparent_background
    autocmd!
    autocmd ColorScheme * highlight Normal guibg=none
    autocmd ColorScheme * highlight NormalFloat guibg=none
    autocmd ColorScheme * highlight NormalNC guibg=none
    autocmd ColorScheme * highlight NonText guibg=none
    autocmd ColorScheme * highlight SignColumn guibg=none
  augroup end

  au BufReadPost *.metal set syntax=cpp

]]
