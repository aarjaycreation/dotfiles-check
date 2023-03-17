function i
	sudo pacman -S $argv
end

function s
	sudo pacman -Ss $argv
end

function u
    sudo pacman -Syu
end

function r
    sudo pacman -Rns $argv
end

