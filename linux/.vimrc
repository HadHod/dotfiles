syntax on              "kolorowanie skladni
set autoindent         "automatyczne wciecia
set number             "numerowanie linii
set noet ts=4 sw=4     "dlugosc tabulacji na ilosc bialych znakow
set ruler              "statystyki
let g:html_use_css="1" "korzystanie ze styli CSS dla plików HTML
se tenc=utf8           "kodowanie w UTF-8
set hlsearch           "podswietlanie szukanego wyrazu

"pokreslanie bialych znakow na koncach linii http://sartak.org/2011/03/end-of-line-whitespace-in-vim.html
autocmd InsertEnter * syn clear EOLWS | syn match EOLWS excludenl /\s\+\%#\@!$/
autocmd InsertLeave * syn clear EOLWS | syn match EOLWS excludenl /\s\+$/
highlight EOLWS ctermbg=red guibg=red

function! <SID>StripTrailingWhitespace()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
nmap <silent> <Leader><space> :call <SID>StripTrailingWhitespace()<CR>
