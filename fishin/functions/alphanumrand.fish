function alphanumrand
    set -l alphabet A B C D E F G H I J K L M N O P Q R S T U V W X Y Z
    set -l letter $(random 1 26)
    set -l number $(random 0 9)
    echo "$alphabet[$letter]$number"
end
