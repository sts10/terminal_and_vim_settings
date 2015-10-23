# Configuring Our Prompt
# ======================


   function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working directory clean" ]] && echo "*"
  }


  # This function is called in your prompt to output your active git branch.
  # function parse_git_branch {
  #   git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
  # }

  function parse_git_branch {
      git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/ (\1$(parse_git_dirty))/"
  }
 

  # This function builds your prompt. It is called below
  function prompt {
    # Define some local colors
    local         RED="\[\033[0;31m\]" # This syntax is some weird bash color thing I never
    local   LIGHT_RED="\[\033[1;31m\]" # really understood
    local        BLUE="/e[0;34m"
    local        CHAR="✚"
    local   CHAR_COLOR="33"
    # ❆ ♥ ♥ ☆ - Keeping some cool ASCII Characters for reference
    # http://www.hongkiat.com/blog/cool-ascii-symbols-get-them-now/

    # colors 
    # http://stackoverflow.com/questions/5947742/how-to-change-the-output-color-of-echo-in-linux

    # Here is where we actually export the PS1 Variable which stores the text for your prompt
    export PS1="\[\e]2;\u@\h\a[\[\e[30;1m\]\t\[\e[0m\]]$RED\$(parse_git_branch) \[\e[0;34m\]\W\[\e[0m\]\n\[\e[0;31m\]$CHAR \[\e[0m\]"
      PS2='> '
      PS4='+ '
    }


  # Finally call the function and our prompt is all pretty
  prompt

  # For more prompt coolness, check out Halloween Bash:
  # http://xta.github.io/HalloweenBash/

  # If you break your prompt, just delete the last thing you did.
  # And that's why it's good to keep your dotfiles in git too.

# Environment Variables
# =====================
  # Library Paths
  # These variables tell your shell where they can find certain
  # required libraries so other programs can reliably call the variable name
  # instead of a hardcoded path.

    # NODE_PATH
    # Node Path from Homebrew I believe
    export NODE_PATH="/usr/local/lib/node_modules:$NODE_PATH"

    # PYTHON_SHARE
    # Python Shared Path from Homebrew I believe
    #   export PYTHON_SHARE='/usr/local/share/python'

    # Those NODE & Python Paths won't break anything even if you
    # don't have NODE or Python installed. Eventually you will and
    # then you don't have to update your bash_profile

  # Configurations

    # GIT_MERGE_AUTO_EDIT
    # This variable configures git to not require a message when you merge.
    export GIT_MERGE_AUTOEDIT='no'

    # Editors
    # Tells your shell that when a program requires various editors, use sublime.
    # The -w flag tells your shell to wait until sublime exits
    export VISUAL="subl -w"
    export SVN_EDITOR="subl -w"
    export GIT_EDITOR="subl -w"
    export EDITOR="subl -w"

  # Paths

    # The USR_PATHS variable will just store all relevant /usr paths for easier usage
    # Each path is seperate via a : and we always use absolute paths.

    # A bit about the /usr directory
    # The /usr directory is a convention from linux that creates a common place to put
    # files and executables that the entire system needs access too. It tries to be user
    # independent, so whichever user is logged in should have permissions to the /usr directory.
    # We call that /usr/local. Within /usr/local, there is a bin directory for actually
    # storing the binaries (programs) that our system would want.
    # Also, Homebrew adopts this convetion so things installed via Homebrew
    # get symlinked into /usr/local
    export USR_PATHS="/usr/local:/usr/local/bin:/usr/local/sbin:/usr/bin"

    # Hint: You can interpolate a variable into a string by using the $VARIABLE notation as below.

    # We build our final PATH by combining the variables defined above
    # along with any previous values in the PATH variable.

    # Our PATH variable is special and very important. Whenever we type a command into our shell,
    # it will try to find that command within a directory that is defined in our PATH.
    # Read http://blog.seldomatt.com/blog/2012/10/08/bash-and-the-one-true-path/ for more on that.
    export PATH="$USR_PATHS:$PYTHON_SHARE:$PATH"

    # If you go into your shell and type: $PATH you will see the output of your current path.
    # For example, mine is:
    # /Users/avi/.rvm/gems/ruby-1.9.3-p392/bin:/Users/avi/.rvm/gems/ruby-1.9.3-p392@global/bin:/Users/avi/.rvm/rubies/ruby-1.9.3-p392/bin:/Users/avi/.rvm/bin:/usr/local:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/local/mysql/bin:/usr/local/share/python:/bin:/usr/sbin:/sbin:

# Helpful Functions
# =====================

# A function to CD into the desktop from anywhere
# so you just type desktop.
# HINT: It uses the built in USER variable to know your OS X username

# USE: desktop
#      desktop subfolder
function desktop {
  cd /Users/$USER/Desktop/$@
}

function code {
  cd /Users/$USER/Documents/code/$@
}

function ink { 
bash /Users/$USER/Documents/code/ink/ink.sh "$1" 
}

function recall_safe {
  cwd=$(pwd) #save pwd as cwd
  cd /Users/samschlinkert/Documents/code/recall_non_gem
  ruby bin/runner.rb
  cd $cwd 
}

function jot {
  MAP="/Users/samschlinkert/Documents/code/jot/path.txt"

  JOT_ROUTE=$(<$MAP)

  if [[ $1 == here ]]
  then 
    NEW_PATH=$(pwd)
    echo "$NEW_PATH/" > $MAP 
    echo "Now jotting in "$NEW_PATH
  elif [[ $1 == where ]]
  then
    echo "You're jotting in "$JOT_ROUTE

    echo "Do you want to go there? (y/n) "
    read -p "" -n 1 -r  
    echo ''   # move to a new line
    if [[ $REPLY =~ ^[Yy]$ ]] 
    then
      cd $JOT_ROUTE
    fi

  elif [[ $1 == all ]]
  then 
    subl $JOT_ROUTE

  else
    INPUT=$1
    NOTE_TITLE=${INPUT// /-}      # replace all spaces with hyphens
    touch $JOT_ROUTE"$NOTE_TITLE".md 
    open  $JOT_ROUTE"$NOTE_TITLE".md 

  fi


}

function octo_new {
  bash /Users/$USER/Documents/code/octo_new/octo_new.sh "$1" # $(pwd) $3
}

function octo_new_f {
  cwd=$(pwd) #save pwd as cwd

  cd /Users/$USER/Documents/code/sts10.github.io 
  if [[ $* == drafts ]]
  then
    git checkout drafts
    ls source/_posts
    echo ''
    echo "Which file from your draft folder would you like to edit? Please enter the file's full name."
    read FILENAME

    cd source/_posts

    if [ ! -f $FILENAME ]  #if this IS a new draft
    then
      echo ''
      echo "Sorry, I don't have that draft. Goodbye."
      git checkout source
      cd $cwd
      return 
    fi

    # move $FILENAME from drafts to source, assuming we'll publish it
    git checkout source
    git checkout drafts -- $FILENAME  # get draft from drafts branch, put in source branch

      # commit changes to source branch 
      git add . 
      git commit -m "move your selected draft to source branch"


    # (temporarily) delete $FILENAME from the drafts branch
    git checkout drafts
      rm $FILENAME
      git add --all . 
      git commit -m "move your selected draft to source branch"

    git checkout source

    open $FILENAME

    

  else
    rake new_post["$*"]
    echo "Creating new octopress post called \""$*"\"."  #\""$1"\""

    cd source/_posts
    FILENAME=`ls -t | head -1`
    open $FILENAME
  fi
  
  
 
  clear 
  echo "Welcome to octo_new!"
  echo ""
  echo "I just opened a file called "$FILENAME" for you! Go write an awesome post!"

  echo ''
  echo "Once you've saved the file of your new post, here are your options:"
  echo ''
  echo "p - publish your octopress blog and commit and push your source branch to GitHub"
  echo 's - save this post as a draft. Drafts are accessible by entering octo_new "drafts" on the command line.'
  echo "d - delete the post you just wrote, and remove it from the source branch of your local Git repo"
  echo "q - quit without doing either of the above"
  echo ''

  # echo "Would you like to commit & push your /n git and publish your Octopress blog now? (y/n)"

  read -p "" -n 1 -r  # Maybe give a "(d)elete this post" option 
  echo ''  # (optional) move to a new line

  git checkout source

  if [[ $REPLY =~ ^[Pp]$ ]]    # if [[ $REPLY =~ ^[Yy]$ ]]
  then
      # commit git and publish blog
      
      cd ../../
      
      
      git add .
      git commit -m  "Used octo_new to publish a new post called "$FILENAME"." # $FILENAME ?

      git push origin source
      rake generate
      rake deploy 

      cd $cwd

  elif [[ $REPLY =~ ^[Dd]$ ]]
  then 
      echo ''
      echo "Are you sure you want to delete "$FILENAME"? (y/n) "
      read REPLY2 
      if [[ $REPLY2 =~ ^[Yy]$ ]]
      then
        rm $FILENAME
        git add --all .
        git commit -m "Deleted post "$FILENAME" using octo_new."
        git push origin source
        echo ''
        echo "Deleted "$FILENAME", removed it from Git, and committed and pushed Git"  
        cd $cwd
      else
        echo "OK, we'll just leave it there and cd you into your blog's directory."
        cd ../../
      fi
  elif [[ $REPLY =~ ^[Ss]$ ]]
  then 

    cd ../../

    git add .
    git commit -m "add draft to source branch temporarily"

    git checkout drafts

    if [ ! -f source/_posts/$FILENAME ]  #if this IS a new draft
    then
      echo "Saving new draft!"

      touch source/_posts/$FILENAME
      

    fi 

    git add .
      git commit -m "add blank"


    git checkout source -- source/_posts/$FILENAME  # move the file I'm working on to drafts

    git add .
    git commit -m "add draft "$FILENAME" to drafts branch."


    # clean up the source branch

    git checkout source

    cd source/_posts

    rm $FILENAME
        git add --all .
        git commit -m "Moved post "$FILENAME" to drafts branch and remove from source branch."
        git push origin source

    cd $cwd  

  else
    echo "OK, we'll just leave it there and cd you into your blog's directory."
    cd ../../  # return to main octopress directory
  fi

}

# A function to easily grep for a matching process
# USE: psg postgres
function psg {
  FIRST=`echo $1 | sed -e 's/^\(.\).*/\1/'`
  REST=`echo $1 | sed -e 's/^.\(.*\)/\1/'`
  ps aux | grep "[$FIRST]$REST"
}

# A function to extract correctly any archive based on extension
# USE: extract imazip.zip
#      extract imatar.tar
function extract () {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)  tar xjf $1      ;;
            *.tar.gz)   tar xzf $1      ;;
            *.bz2)      bunzip2 $1      ;;
            *.rar)      rar x $1        ;;
            *.gz)       gunzip $1       ;;
            *.tar)      tar xf $1       ;;
            *.tbz2)     tar xjf $1      ;;
            *.tgz)      tar xzf $1      ;;
            *.zip)      unzip $1        ;;
            *.Z)        uncompress $1   ;;
            *)          echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# Aliases
# =====================
  # LS
  alias l='ls -lah'

  # Git
  alias gst="git status"
  alias gl="git pull"
  alias gp="git push"
  alias gd="git diff | mate"
  alias gc="git commit -v"
  alias gca="git commit -v -a"
  alias gb="git branch"
  alias gba="git branch -a"

  alias emacs="/usr/local/Cellar/emacs/24.3/Emacs.app/Contents/MacOS/Emacs -nw"
  alias gvim="/Applications/MacVim.app/Contents/MacOS/Vim"
  
# Final Configurations and Plugins
# =====================
  # Git Bash Completion
  # Will activate bash git completion if installed via homebrew
  # (via: http://apple.stackexchange.com/questions/154701/git-autocompletion-is-not-working-with-homebrew?answertab=votes#tab-top)
  if [ -f `brew --prefix`/etc/bash_completion.d/git-completion.bash ]; then
      . `brew --prefix`/etc/bash_completion.d/git-completion.bash
  fi

  # if you're using OS X versions before Yosemite (10.10.5), use this:
  #if [ -f `brew --prefix`/etc/bash_completion ]; then
    #. `brew --prefix`/etc/bash_completion
  #fi

  # RVM
  # Mandatory loading of RVM into the shell
  # This must be the last line of your bash_profile always
  [[ -s "/Users/$USER/.rvm/scripts/rvm" ]] && source "/Users/$USER/.rvm/scripts/rvm"  # This loads RVM into a shell session.
