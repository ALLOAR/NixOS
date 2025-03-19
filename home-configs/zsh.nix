{ config, pkgs, ... }: {
	 
	programs.zsh = {
                enable = true;
                shellAliases = {
                        rebuild = "sudo nixos-rebuild switch";
                        rebuildh = "home-manager switch";
                        prog = "nano /etc/nixos/configurations/programs.nix";
                        c = "sudo nano /etc/nixos/configuration.nix";
			cdc = "cd /etc/nixos/";
			cdh = "cd /home/alloar/.config/home-manager/";
                	act = "source venv/bin/activate";
			deac = "deactivate";
			p = "python";
			p-start = "python3 -m venv venv";
		};
                oh-my-zsh = {
                        enable = true;
                        plugins = [ "git" "z" "sudo" "extract" "colored-man-pages" ];
                        #git - для меня еще рановато
                        #z - тип удобно переходить в директорию или открывать файл который ты часто
                        #sudo esc + enter и команда автоматически добавляет sudo но для nixos бесползено
                        #extract - удобная розпаковка файлов
                        #colored-man-pages - удобная хрень для чтения ls --help но в виде команды man ls

                        #theme = "agnoster"; - какое-то говно, 100% скип
                        theme = "robbyrussell"; # дефолт минимализм
                        #theme = "bira"; ну тип баш строка только в 2 ряда
                        #theme = "dst"; то же самое что и прошлое только хуже
                        #theme = "gentoo"; почти то же самое что и дефолт, скип
                        #theme = "minimal"; дефолт минимализм только белое
                        #theme = "mortalscumbag"; редкостная хуета
                        #theme = "pure"; не понял но тоже самое что и bira
                        #theme = "pygmalion"; дефолт баш только с рвотными цветами
                        #theme = "refined"; прям таки ультра минимализм но в 2 строки
                        #theme = "sporty_256"; ох блядь какое же говно
                        #theme = "ys"; противополножность минимализму, зато с встроеными часами, +
                        #theme = "af-magic"; необычно и прикольно, подправить цвета и гуд
                        #theme = "avit"; странно но хуйня
                };
        };
}
