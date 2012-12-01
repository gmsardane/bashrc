#### Shell settings and options ####

set -o noclobber # prevent redirect from overwriting files (use >| to over-ride)
set -o interactive-comments
set -o vi

# Shell options check 'man bash' for descriptions
shopt -s cdspell
shopt -s checkwinsize
shopt -s cmdhist
shopt -s extglob
shopt -s huponexit
shopt -u mailwarn

umask 022