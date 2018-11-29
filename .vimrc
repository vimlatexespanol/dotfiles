" Para la sintaxis en cualquier lenguaje que reconozca
syntax on
" Indentación en los archivos, según su extensión
filetype indent plugin on
" Para darle a la indentación un tamanio de 4 espacios
set shiftwidth=4
set nocompatible

" Tamanio de cada línea de máximo 79 caracteres: (Activar cuando se considere
" necesario)
"set tw=80

" Para mostrar números relativos al renglón actual, y el número
" de la línea actual
set nu relativenumber

set path+=** " Busca un archivo en subcarpetas al usar el comando find.
set wildmenu " Busca y muestra una lista de archivos al usar
	     " :find y una sub-cadena :3

"Permite crear el archivo tags. Y tambien permite autocompletar 
command! MakeTags !ctags -R .

" Inserta plantilla html
nnoremap ,html :-1read $HOME/.vim/.skeleton.html<CR>

" Permite activar la corrección ortográfica
map <F6> :setlocal spell! spelllang=es<CR>

" Permite ejecutar una orden escrita dentro de nuestro archivo de texto
" y de esta manera, el regreso lo escriba en el archivo (Presionar Q)
:noremap Q !!$SHELL<CR>

" Presentación en Sent
map <F8> :w!<CR>:!sent <c-r>% &<CR><CR>

""" Chaconeado del .vimrc de Luke Smith:
" Detectar archivos de groff
autocmd BufRead,BufNewFile *.ms,*.me,*.mom set filetype=groff
" Navegando con guías <++>
inoremap <Space><Tab> <Esc>/<++><Enter>"_c4l
vnoremap <Space><Tab> <Esc>/<++><Enter>"_c4l
map <Space><Tab> <Esc>/<++><Enter>"_c4l
inoremap ;gui <++>

" Formato de HTML
autocmd FileType htm,html inoremap ;p <p><++></p><CR><CR><++>
autocmd FileType htm,html inoremap ;b <strong><++></strong><++>
autocmd FileType htm,html inoremap ;i <em><++></em><++>
autocmd FileType htm,html inoremap ;h1 <h1><++></h1><CR><CR><++>
autocmd FileType htm,html inoremap ;h2 <h2><++></h2><CR><CR><++>
autocmd FileType htm,html inoremap ;h3 <h3><++></h3><CR><CR><++>
autocmd FileType htm,html inoremap ;a <a><++></a><++>
autocmd FileType htm,html inoremap ;img <img src="<++>"><++>
autocmd FileType htm,html inoremap ;tab <table><CR><++><CR></table>
autocmd FileType htm,html inoremap ;tr <tr><CR><++><CR></tr>
autocmd FileType htm,html inoremap ;td <td><++></td>
autocmd FileType htm,html inoremap ;ol <ol><CR><++><CR></ol>
autocmd FileType htm,html inoremap ;ul <ul><CR><++><CR></ul>
autocmd FileType htm,html inoremap ;li <li><++></li>
autocmd FileType htm,html inoremap ;br <br><CR>


" Formato de LaTeX
autocmd FileType tex inoremap ;chap \chapter{<++>}
autocmd FileType tex inoremap ;sec \section{<++>}
autocmd FileType tex inoremap ;subs \subsection{<++>}
autocmd FileType tex inoremap ;b \textbf{<++>}
autocmd FileType tex inoremap ;em \emph{<++>}

" Formato de markdown
autocmd FileType rmd,markdown inoremap ;b **<++>**<++>
autocmd FileType rmd,markdown inoremap ;i _<++>_<++>
autocmd FileType rmd,markdown inoremap ;h1 # <++>
autocmd FileType rmd,markdown inoremap ;h2 ## <++>
autocmd FileType rmd,markdown inoremap ;h3 ### <++>
autocmd FileType rmd,markdown inoremap ;img ![<++>](<++>)

" Abrir un pdf de este archivo LaTeX o markdown usando xreader o mupdf
autocmd FileType rmd,tex,mdb map <leader>p :!mupdf <c-r>%<backspace><backspace><backspace>pdf &<CR><CR>
autocmd FileType rmd,tex map -p :!zathura <c-r>%<backspace><backspace><backspace>pdf &<CR><CR>
autocmd FileType markdown,groff map <leader>p :!mupdf <c-r>%<backspace><backspace>pdf &<CR><CR>
autocmd FileType markdown,groff map -p :!zathura <c-r>%<backspace><backspace>pdf &<CR><CR>

" Ejecutar el script compilador [ \ + c ]
map <leader>c :!bash ~/.scripts/compiler.sh <c-r>%<CR><CR>

" Para mayores detalles:

" Para compilar en C. F9 Compila, F5 ejecuta
autocmd FileType c map <F9> :!gcc -o <c-r>%<backspace><backspace> <c-r>%<CR>
autocmd FileType c map <F5> :!./<c-r>%<backspace><backspace><CR>

" Ejecución en Python. F5 python 2. F7 python 3.5
autocmd FileType python map <F5> :!python <c-r>%<CR>
autocmd FileType python map <F7> :!python3.5 <c-r>%<CR>

" Compilar markdown a pdf (texto)
autocmd FileType markdown map <F5> :!pandoc<space><C-r>%<space>-o<space><C-r>%<backspace><backspace>pdf<space>-V<space>geometry:margin=1in<space>-V<space>fontsize=12pt<space>--template=mytemplate.latex<space>--latex-engine=xelatex<Enter><Enter>

" Compilar markdown a pdf (presentación)
autocmd FileType markdown map <F7> :!pandoc<space><C-r>%<space>-o<space><C-r>%<backspace><backspace>pdf<space>--latex-engine=xelatex<space>--template=mytemplate.beamer<space>-t<space>beamer<Enter><Enter>

" Compilación de groff a pdf
autocmd Filetype groff map <F5> :!groff<space>-ms<space><C-r>%<space>-k<space>-e<space>-t<space>-T<space>pdf<space>><space><C-r>%<backspace><backspace>pdf<Enter><Enter>
autocmd Filetype groff map <F7> :!groff<space>-ms<space>-k<space>-Tps<space>-t<space><C-r>%\|<space>ps2pdf<space>-<space><C-r>%<backspace><backspace>pdf<Enter><Enter>

" Compilación de R markdown
autocmd Filetype rmd map <F5> :!echo<space>"require(rmarkdown);<space>render('<c-r>%')"<space>\|<space>R<space>--vanilla<enter>

" Compilar LaTeX a pdf (f5 para pdflatex f7 para xelatex)
autocmd FileType tex map <F5> :!pdflatex<space><c-r>%<CR><CR>
autocmd FileType tex map <F7> :!xelatex<space><c-r>%<CR><CR>

" Inicio de plugins
" Goyo es un plugin que permite la escritura en VIM en modo sin distracciones.
map -g :Goyo<CR>

call plug#begin()

Plug 'junegunn/goyo.vim'

call plug#end()
