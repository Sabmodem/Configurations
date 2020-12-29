if [ -e $HOME/.emacs.d/snippets ]
then
    rm $HOME/.emacs.d/snippets
fi
if [ -e $HOME/.emacs.d/themes ]
then
   rm -r $HOME/.emacs.d/themes
fi

mkdir $HOME/.emacs.d/themes
cd $HOME/.emacs.d
ln -s $(find -name snippets)

cd $HOME/.emacs.d/themes
for theme_dir in $(find .. -name "*theme*" -type d)
do
    ln -s $theme_dir $HOME/.emacs.d/themes/
done

rm $HOME/.emacs.d/themes/themes

cd $HOME/.emacs.d
if [ -e ./HTML5-YASnippet-bundle ]
then
    rm -r -f ./HTML5-YASnippet-bundle
fi

git clone https://github.com/gausby/HTML5-YASnippet-bundle

if [ -e ./snippets/html-mode ]
then
    rm -r ./snippets/html-mode
fi

if [ -e ./snippets/web-mode ]
then
    rm -r ./snippets/web-mode
fi

mv ./HTML5-YASnippet-bundle/snippets/* ./snippets/
rm -r -f ./HTML5-YASnippet-bundle
