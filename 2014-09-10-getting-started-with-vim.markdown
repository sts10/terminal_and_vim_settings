---
layout: post
title: "Getting Started With Vim"
date: 2014-09-10 19:21:29 -0400
comments: true
categories: ["Vim", "Emacs", "text editors"]
---

Since 2012-ish I've been using Sublime Text 2 as my primary text editor. It's very simple out of the box, but also allows for a fair amount of customization through its packages, settings, snippets, and custom keybindings. I've written about [how I use Sublime Text](http://sts10.github.io/blog/2014/03/01/some-sublime-text-tips-and-tricks/) before, and I still think it's a super powerful editor. 

However after meeting and talking to some Emacs and Vim users, I figured I should at least explore those two options. First, I looked into Emacs. 

<!-- more -->

## Emacs

There's a lot to say about [Emacs](http://en.wikipedia.org/wiki/Emacs): it's written in or runs on a programming language called Lisp, the original version started to be developed in 1976, it's still very much in use today, etc. 

As I understand it, the word "Emacs" actually refers to a "family" of text editors, connected at least by a protocol that uses the control key for navigation and shortcuts. Some implementations of Emacs run in your terminal, while others you can download and install as stand-alone applications. The users I met used it in their terminal (either OS X's Terminal application or [iTerm2](http://iterm2.com/)), so that's what I wanted to try first. 

So I booted up Terminal and, figuring it came with my Macbook, typed in `emacs` and, lo and behold, a program opened in the terminal window. Emacs uses the control key for basically everything, including basic navigation that the arrow keys would usually be used for (control+f is right, control+b is left, control+b is up, and control+p is up).

I took some time to learn [the basics](http://www.rgrjr.com/emacs/emacs_cheat.html) and after a few days the basic navigation and cut and paste ("kill" and "yank") started to sort of feel natural to me. I took some steps forward from there: I got into window management a little, I updated my version of emacs that ran in the terminal to GNU Emacs 24.3.1 in order to get better syntax highlighting (the version that came with my computer couldn't highlight Ruby for example).

(I unfortunately don't remember how I upgraded it but here's [the GNU Emacs website](http://www.gnu.org/software/emacs/) and here's the alias I had to put in my `~/.bash_profile` to make my terminal open the new version when I typed `emacs`):

```
alias emacs="/usr/local/Cellar/emacs/24.3/Emacs.app/Contents/MacOS/Emacs -nw"
```

I even [switched my control and caps lock keys](http://stackoverflow.com/questions/15435253/how-to-remap-the-caps-lock-key-to-control-in-os-x-10-8), which was super helpful for Emacs but also other shortcuts that use control. 

But after playing around with some small Ruby scripts it just didn't take. I went back to Sublime, which, I learned has the basic emacs navigation commands built in (so for example Ctrl+f goes forward, Ctrl+b goes back), so I tried to use those and avoid the arrow keys when I used Sublime. But seeing as how spread out those keys are (and knowing the Vim alternative was more efficient) it didn't feel like that much of an advantage. So I went back to Sublime, but I was still open to trying new things. (Oh and I totally kept the caps lock and control key switch-- highly recommended even if you're using Sublime Text.) 

## Flirting with Vim: Sublime Text's Vintage Package  

Upon returning to the safety of Sublime, I decided I wanted to be a bit more adventurous. So I went into my User setting and unignored the ["Vintage" package](https://www.sublimetext.com/docs/2/vintage.html). Sublime Text ships with a package called Vintage, which emulates Vim's insert/command modes. By default it is ignored so first-time users don't mistakenly get stuck in command mode. But once you remove it (or comment it out) from your ignored packages in your user settings, hitting Escape in Sublime will take you into a "command mode" that emulates Vim's command mode.

Here's [Jeffrey Way's video tutorial on Vintage Mode](https://www.youtube.com/watch?v=U5ZYOmo0KuI). He also goes over the basic vi navigation (h j k l) and some more vi basics. 

So for a few days or weeks I kept using Sublime but tried not to use the arrow keys (i.e. tried to use it as if it was Vim). I know a programmer who uses this setup-- Sublime Text 2 with Vintage mode enabled-- so I figure it's pretty legit. You still get all the good stuff in Sublime (like the awesome Cmd+d functionality), but you also get the cool, simple Vim commands like "change" and "yank". 

Hoping this might be my new jam as well, I searched Google for some good additional keybindings or packages to use on top of the Vintage package. Rather than finding good tips, I came upon this Quora thread where a user asked ["Is Sublime Text's "vintage mode" a clever way to learn Vim?"](http://www.quora.com/Is-Sublime-Texts-vintage-mode-a-clever-way-to-learn-Vim). 

I read Sandeep Shete's answer, which concludes with the sentiment: "If you want to learn Vim then I guess one-two weeks with Vintage mode in Sublime is enough to not make you feel lost in Vim. Staying with Vintage mode any longer won't make you better at Vim anymore than you already would be." Clearly there are parts of Vi/Vim that simply cannot be replicated in Sublime Text, and it seems logical that those are the very parts that make Vi/Vim such a powerful, time-saving editor. 

So this past week and weekend, stuck in a programming rut, I decided to at least setup my Vi/Vim environment and see how it went. 

## Vi/Vim 

First, I ran `vi` in my terminal. I was greeted with a centered introductory screen that begins: "VIM - Vi IMproved version 7.3". 

Apparently "Since MacOS 10.3 the 'vi' program is actually a console version of Vim 6.2 or later." That quote is from [the vim.org download page](http://www.vim.org/download.php#mac). Therefore from now on in this blog post, in attempt to minimize confusion, I'm just going to use "Vim" (as opposed to vi) to refer to the editor.

Apparently the current release of Vim is 7.4 but I chose not to try to upgrade my version, again figuring that jump from 7.3 to 7.4 was minor and that upgrading would be a complicated operation. 

## Actually Learning Vim

Now I had to actually learn Vim for real. Derek Wyatt has [a great series of online videos](http://derekwyatt.org/vim/tutorials/novice/#Welcome) that served as my proper introduction to Vim. 

Obviously I could write out a bunch of Vim commands here but I don't think that would be useful for you. I'd say my basic tips are (1) not to get flustered by visual mode and its 3 variants, (2) commands that start with a colon ':' are like file level commands (save file, quit Vim, change a setting, etc.) and (3) these colon commands can be run on an individual file, or they can be pasted into your .vimrc to be made to run for every Vim file when it starts. But honestly you should just go through his videos. 

Below, though, is more about how I setup my Vim environment. 


## Setting Up My Vim Environment

Right, so the disclaimer here is that I learned all of the following from the Internet in the last four days. So, you know, grain of salt. But it might help you get started. Note: I'm running OS X 10.9.4. 

### The .vimrc File

All of your personal Vim configuration stuff goes into a file called .vimrc which should be located in your home directory, i.e. `~/.vimrc`. I'm not sure, but I may have had to create this file with `touch ~/.vimrc`, but I'm not sure-- it might have already been there.

The .vimrc file is like a combination of your Sublime Text 2 User Preferences and your User keybindings. This is where you'll set options like your tab width, default color scheme, and your line break preference, as well as your keybindings. 

Here is [my current .vimrc file](https://github.com/sts10/terminal_and_vim_settings/blob/master/vimrc) (Note that in the repo I removed the leading dot in the file name so I could push it to Git more easily). That might not be much help to you, so here's Derek Wyatt's [explanation of the vimrc file](http://derekwyatt.org/2009/08/20/the-vimrc-file.html) and his recommendation for [an absolute bare minimum vimrc file](http://derekwyatt.org/2009/08/20/the-absolute-bare-minimum). Both are super helpful (for example **syntax highlighting**, by default is turned OFF!).

### A Custom Keybinding of Note

So in standard Vim you hit `i` to enter Insert mode and `Escape` to exit Insert mode and return to Command mode. I found the escape key to be a bit of a reach for me, plus on my Macbook Air keyboard it's physically pretty small. So I pasted a custom keybinding into my .vimrc file to make a quick double-tap of `i` exit Insert mode. Here's the line: 

`imap ii <Esc>`

However this binding does have a few draw backs, namely if you want to type 2 i's quickly in your text, and there's obviously a bit of a delay before i's appear on the screen. But also, slightly more seriously, if you ever want to paste text that had two i's next to each other from the system clipboard into Vim, Vim freaks out and exits Insert mode. I'm still weighing whether this is a problem large enough for me to change the keybinding. 


### Pathogen and NERDTree

Next I wanted to add a sidebar to manage multiple files in multiple windows (like in Sublime Text). To do this I decided to install the [NERDTree plugin](https://github.com/scrooloose/nerdtree). However, as you'll notice in the installation section of NERDTree's readme on Github, it recommends using something called pathogen.vim. [Pathogen](https://github.com/tpope/vim-pathogen) is apparently the go-to package/plugin manager for Vim, and installing it is delightfully easy. After installing it I added the line `execute pathogen#infect()` to my .vimrc file as instructed in the Pathogen readme. 

After reading the NERDTree readme I also decided to paste these two lines to my .vimrc file as well: 

```
" Control + n to toggle NERDTree sidebar
map <C-n> :NERDTreeToggle<CR>

" Allows you to quit Vim if the only window left open is a NERDTree (https://github.com/scrooloose/nerdtree) 
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
```

So now Control+n opens the NERDTree sidebar, and Vim closes if the NERDTree sidebar is the only window left. 

NERDTree has been working really well. You navigate to it like any other window (control+w then the direction to the window), then use j and k to navigate between the files in the directory. I open files with either `i` or `s`, depending if I want the new files to split the current window configuration vertically or horizontally (for more on window management in Vim, checkout Derek Wyatt's section on [Working with Many Files (Screencast 3)](http://derekwyatt.org/vim/tutorials/novice/#Many_Files_3)). 

NERDTree also has allowed me to not have to deal with the Vim buffer, which, when I watched the Wyatt video covering it, seemed cool but un-Sublime like to me. Honestly I'm glad I can seemingly avoid learning its ins and outs for now.   

### Color Schemes

Of course you can just roll with your terminal colors and the default Vim syntax highlighting. But I knew that if I actually wanted to use Vim instead of Sublime to code, I'd have to make it look and feel like [my Sublime Text](http://sts10.github.io/blog/2014/02/14/my-current-coding-setup/). I set my Terminal font-face to [DejaVu Sans Mono](http://dejavu-fonts.org/wiki/Download), so that my Vim running in Terminal would also use it. But I also needed to get the colors right to emulate my favorite Sublime theme, [Mustard](http://devthemez.com/themes/mustard).  

I had a tough time figuring out how color schemes work in Vim. Part of my confusion stems from the fact that some color schemes you can download for Vim require your terminal have access to 256 colors rather than the usual 16.  

Remember, I'm choosing to run Vim through the OS X's Terminal app, which I believe can only ever handle 16 colors. You can run Vim with 256 colors by downloading and running [MacVim](https://code.google.com/p/macvim/), but I just didn't want to do that (note that MacVim is also known as Cocoa Gui, or gvim. More info [here](http://www.vim.org/download.php#mac)).  

Further adding to my confusion was [iTerm2](http://iterm2.com/)'s promise of being able to run Vim with 256 colors-- I just could not get that to work as expected. 

Maybe you'll have more luck. 

Thankfully the basic methodology for installing and loading a colorscheme seems to be the same no matter if you're using Terminal, iTerm, or MacVim. You simply mkdir a directory `~/.vim/colors` and then you drop special `.vim` files in there. Once there in the `colors` directory, you can run `:colorscheme colorschemename` in your vim buffer or, to set the default color scheme, just put that same line your `.vimrc` file. 

I needed some base16 Vim color schemes and I eventually found [this git repo](https://github.com/chriskempson/base16-vim) that claimed to be full of them, but when I loaded them their colors were off. This was probably due to the fact that I had modified the 16 ANSI colors in my Terminal preferences to suit [my Terminal setup](http://sts10.github.io/blog/2014/02/05/flatiron-day-two/).  

So I set out to make my own base16 color scheme, based off the one I've been using in Sublime Text for months, which is called [Mustard](http://devthemez.com/themes/mustard). It took me a few hours to figure what color affected what part of Ruby, Python, and HTML code, but I ended up with a pretty good match-- [here's the mustard.vim file I created](https://github.com/sts10/terminal_and_vim_settings/blob/master/mustard.vim).

If you actually want to use my colorscheme, you should know 2 things: (1) as it says on line 2 of the file, you need to `:set background=dark` to get the colors I picked to emulate the original Mustard theme. 

And (2) note that to get the alterations to the 16 default Terminal colors necessary to make it actually look like the Mustard Sublime theme, you may have to load [my Terminal settings](https://github.com/sts10/terminal_and_vim_settings/blob/master/sts_sep_2014.terminal) as well (note: these setting cannot be loaded into iTerm2, only OS X's Terminal app).

## Conclusion 

Well that's about it for now. I know this ran pretty long, as usual. I typed this in Vim though, so it was good practice! No promises if I'll use Vim for coding going forward, but every day it's starting to feel more natural. 


