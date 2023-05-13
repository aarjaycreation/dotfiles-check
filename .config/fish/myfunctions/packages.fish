function i
	sudo pacman -S $argv
end

function zi
	sudo zypper install $argv
end

function s
	sudo pacman -Ss $argv
end

function zs
	sudo zypper search $argv
end

function u
    sudo pacman -Syu
end

function zu
    sudo zypper refresh && sudo zypper update
end

function r
    sudo pacman -Rns $argv
end

function zr
    sudo zypper remove $argv
end

