if [ -e $HOME/.emacs.d/snippets ]
then
   rm $HOME/.emacs.d/snippets
fi
if [ -e $HOME/.emacs.d/themes ]
then
   rm -r $HOME/.emacs.d/themes
fi

mkdir $HOME/.emacs.d/themes
cd $HOME/.emacs.d/.cask/
ln -s $(find -name snippets) $HOME/.emacs.d/snippets

for theme_dir in $(find -name "*theme*" -type d)
do
    ln -s $(echo $theme_dir) $(echo $theme_dir | grep -o '[A-Za-z -]*')
done

for theme_dir in $(find -name "*theme*" -type d)
do
    mv $(echo $theme_dir) $HOME/.emacs.d/themes/
done
