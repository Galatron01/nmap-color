function nmap() {
    if command -v nmap-color &>/dev/null; then
        command nmap "$@" | nmap-color
    else
        command nmap "$@"
    fi
}
