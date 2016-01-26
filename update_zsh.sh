#!/bin/bash
# Use > 1 to consume two arguments per pass in the loop (e.g. each
# argument has a corresponding value to go with it).
# Use > 0 to consume one or more arguments per pass in the loop (e.g.
# some arguments don't have a corresponding value to go with it such
# as in the --default example).
# note: if this is set to > 0 the /etc/hosts part is not recognized ( may be a bug )

HOME_DIR=/cygdrive/d

while [[ $# > 1 ]]
do
key="$1"

case $key in
    -h|-home|--home)
    HOME_DIR="$2"
    shift # past argument
    ;;

    *)
            # unknown option
    ;;
esac
shift # past argument or value
done

(grep -q '^alias work' ~/.zshrc && sed -i 's/^alias.work=.*/alias work="cd __HOME_DIR__"/' ~/.zshrc && sed -i "s@__HOME_DIR__@$HOME_DIR@" ~/.zshrc) || echo "alias work=\"$HOME_DIR\"" >> ~/.zshrc
grep -q '^work' ~/.zshrc || echo "work" >> ~/.zshrc

#modify zsh plugins
sed -i 's/^plugins=.*/plugins=(git z jump sublime)/' ~/.zshrc

#git store credentials
#uname | (grep -q '^CYGWIN' && echo 'hello') || echo 'nono'

cp zsh.aliases ~/.oh-my-zsh/zsh.aliases
grep -q '^source.$ZSH.*aliases' ~/.zshrc && sed -i 's@^source.$ZSH.*aliases@source $ZSH/zsh.aliases@' ~/.zshrc || echo 'source $ZSH/zsh.aliases' >> ~/.zshrc
