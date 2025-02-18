# vim-termsend: A vim plugin that sends lines to the terminal

## What vim-termsend is

vim-termsend is a vim plugin that sends lines from the currently editing
window to the terminal for execution.

This is useful when the commands you want to execute is recorded in Markdown
or other format, and you want to execute each line in the terminal.

## Requirements

Neovim 0.10+

## Demo

TODO

## Install

Using the vim-plug plugin manager:

```vim
Plug 'kumarstack55/vim-termsend'
```

## Usage

Launch a terminal in a split window.

```vim
:split | term
```

You can display the terminal and the editor at the same time.

Write the command you want to execute in the editor window.
For example, write `ls`.

Then move the cursor to the line and execute the next command.

```vim
:TermSend
```

You can see that the line is executed!

(Optional) You can map the `TermSend` command to a key.

```vim
nmap <Leader>ts :TermSend<CR>
```

## TODO

- [ ] Support Vim9+

## LICENSE

MIT
