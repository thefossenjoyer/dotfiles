function fish_prompt
    # set -l textcol  white
    # set -l bgcol    blue
    set -l arrowcol red
    # set_color $textcol -b $bgcol

    set -l current_dir (basename $PWD)

    # if echo basename $PWD | xargs = "/home/thefossenjoyer"
    # 	echo -n ""~" "
    # else
    # 	echo -n ""(basename $PWD)" "
    # end


    echo -n ""(basename $PWD)" "
    set_color $arrowcol -b normal
    echo -n "λ "

# echo (basename $PWD) 'λ '
end
