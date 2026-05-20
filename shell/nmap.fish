function nmap --wraps=nmap --description 'nmap with Dracula colorization'
    if command -sq nmap-color
        command nmap $argv | nmap-color
    else
        command nmap $argv
    end
end
