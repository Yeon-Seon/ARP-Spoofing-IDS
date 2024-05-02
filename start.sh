#!/bin/bash

# Function to display BM-TechID ASCII art
show_logo() {
    echo " __  __ _       _     _           _   ____  _             "
    echo "|  \/  (_) __ _| |__ (_)_ __   __| | |  _ \| |_   _  ___ "
    echo "| |\/| | |/ _\` | '_ \| | '_ \ / _\` | | |_) | | | | |/ _ \\"
    echo "| |  | | | (_| | | | | | | | | (_| | |  __/| | |_| |  __/"
    echo "|_|  |_|_|\__, |_| |_|_|_| |_|\__,_| |_|   |_|\__,_|\___|"
    echo "           |___/                                          "
    echo ""
}

# Function to check if Python is installed
check_python() {
    if command -v python3 &>/dev/null; then
        echo "Python sudah terinstal."
    else
        echo "Python belum terinstal. Memulai instalasi..."
        ./install_python.sh
    fi
}

# Function to enter device.sh script
enter_device() {
    echo "Masuk ke /src/device.sh..."
    # Panggil skrip device.sh di sini
    ./src/device.sh
}

# Function to enter monitoring.py script
enter_monitoring() {
    echo "Masuk ke /src/monitoring.py..."
    # Panggil Python script monitoring.py di sini
    check_python && ./src/monitoring.py
}

# Function to enter seize.py script
enter_seize() {
    echo "Masuk ke /src/seize.py..."
    # Panggil Python script seize.py di sini
    check_python && ./src/seize.py
}

# Main menu function
main_menu() {
    clear
    show_logo
    echo "Selamat datang di BM-TechID!"
    echo "Silakan pilih opsi:"
    echo "1. Masuk ke /src/device.sh"
    echo "2. Masuk ke /src/monitoring.py"
    echo "3. Masuk ke /src/seize.py"
    echo "4. Keluar"
    read -p "Masukkan pilihan Anda: " choice

    case $choice in
        1) enter_device ;;
        2) enter_monitoring ;;
        3) enter_seize ;;
        4) echo "Terima kasih telah menggunakan BM-TechID. Selamat tinggal!" && exit ;;
        *) echo "Pilihan tidak valid. Silakan coba lagi." && sleep 2 ;;
    esac
}

# Entry point
main_menu
