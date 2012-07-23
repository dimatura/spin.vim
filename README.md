# spin.vim

This is the git repo for my (old, incomplete) Spin syntax file. The Vim scripts
page is [here](http://www.vim.org/scripts/script.php?script_id=3019).

## script type

syntax
 
## description

This is a syntax file for the Spin language, designed by Parallax for the
[Propeller microcontroller](http://www.parallax.com/tabid/407/Default.aspx).
Now there's cross-platform command line tools to upload your Spin programs to
the Propeller, so you don't need the Propeller IDE (and hence, Windows) to use
it.

I based this syntax file on the syntax file for the Python language, since the
 languages have certain similarities.
 
## install details

The easiest way is to put `spin.vim` in your `.vim/syntax` directory and add
something like the following to your `.vimrc`:

    au BufRead,BufNewFile *.spin set filetype=spin
    au! Syntax spin source $HOME/.vim/syntax/spin.vim

---

Daniel Maturana - dimatura@cmu.edu
