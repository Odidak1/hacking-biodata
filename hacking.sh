#!/bin/bash

GREEN='\033[0;32m'
CYAN='\033[0;36m'
RESET='\033[0m'

cities=(
    "Ambon" "Balikpapan" "Bandung" "Banjarmasin" "Batam" "Bekasi" "Bogor" "Cirebon" "Denpasar"
    "Depok" "Gorontalo" "Jakarta" "Jayapura" "Kediri" "Kendari" "Kupang" "Lampung" "Madiun"
    "Makassar" "Malang" "Manado" "Mataram" "Medan" "Padang" "Palembang" "Palu" "Pekanbaru"
    "Pontianak" "Salatiga" "Samarinda" "Semarang" "Serang" "Sidoarjo" "Solo" "Sorong" "Subang"
    "Surabaya" "Tangerang" "Tasikmalaya" "Tegal" "Yogyakarta" "Banda Aceh" "Palangkaraya"
    "Ternate" "Bau-Bau" "Pangkal Pinang" "Tarakan" "Baubau" "Bengkulu" "Sabang" "Langsa"
    "Lhokseumawe" "Sibolga" "Binjai" "Tebing Tinggi" "Pematangsiantar" "Padangsidempuan"
    "Gunungsitoli" "Kisaran" "Lubuklinggau" "Prabumulih" "Tanjungpinang" "Batang"
)

randomize_array() {
    local arr=("$@")
    local size=${#arr[@]}
    for ((i=0; i<size; i++)); do
        local rand_index=$((RANDOM % size))
        local temp="${arr[i]}"
        arr[i]="${arr[rand_index]}"
        arr[rand_index]="$temp"
    done
    echo "${arr[@]}"
}

clear
echo -e "${GREEN}Initializing system..."
sleep 1
echo -e "${GREEN}Accessing mainframe server..."
sleep 2

echo -e "${GREEN}Bypassing government security protocols..."
sleep 1
for i in {1..5}; do
    echo -ne "${GREEN}Hacking... ["
    for j in $(seq 1 $i); do
        echo -ne "${CYAN}="
    done
    for j in $(seq $i 5); do
        echo -ne " "
    done
    echo -ne "${GREEN}] $((i * 20))% complete\r"
    sleep 1
done
echo -e "${GREEN}Access granted!"
sleep 2

echo -e "${GREEN}Pilih kota yang akan diretas:"
for i in "${!cities[@]}"; do
    printf "%d) %s\n" "$((i+1))" "${cities[$i]}"
done

read -p "Masukkan nomor kota: " city_index
selected_city="${cities[$((city_index-1))]}"
echo -e "${GREEN}Memulai proses peretasan di kota $selected_city..."
sleep 2

citizens=(
    "Farel Pratama" "Dinda Ayu Safitri" "Bima Alif" "Salsabila Putri Ananda" "Rizky Maulana"
    "Shania Zahra Permata" "Aditya Nugraha" "Keisha Amalia" "Farhan Iskandar" "Syifa Khairunnisa"
    "Aldi Ramadhan" "Aurel Novitasari Wijaya" "Dika Surya Saputra" "Nadira Hana Putri"
    "Bayu Septian" "Livia Ramadhani" "Naufal Arya" "Rania Fadhila Zahira" "Zaki Firmansyah"
    "Indira Cahaya Pramudita" "Rafael Maulana" "Bunga Melati" "Cahya Ria" "Guntur Prabowo"
    "Hanafi Nasution" "Jasmine Amira" "Luthfi Handika" "Melani Kurnia" "Nabilla Raisa"
    "Rizal Faiz" "Siti Rahma" "Tari Rahayu" "Umar Faruq" "Winda Sari"
    "Yusuf Zain" "Zara Novia" "Dewi Lestari" "Erik Prasetyo" "Fikri Hidayat"
    "Galang Setiawan" "Hafizul Rahman" "Intan Permata" "Joko Susilo" "Kirana Arum"
    "Lina Puspa" "Maya Nabila" "Nadia Purnama" "Omar Dwi" "Putra Rizki"
    "Rina Maya" "Sari Rahmadani" "Toni Priyono" "Ulya Febriani" "Vira Puspa"
    "Widyawati" "Xandria Bellina" "Yosep Kurnia" "Zara Maulani" "Rudi Iskandar"
    "Andi Saputra" "Riska Kurnia" "Dani Firmansyah" "Cynthia Saragih" "Nina Lestari"
)

timestamp=$(date +"%Y-%m-%d_%H-%M-%S")
output_file="/storage/emulated/0/Hacked_${selected_city}_${timestamp}.txt"

{
    echo "===== Hasil Retasan Kota $selected_city ====="
} > "$output_file"

generate_email() {
    local name="$1"
    local domains=("gmail.com" "yahoo.com" "hotmail.com" "outlook.com")
    local domain="${domains[RANDOM % ${#domains[@]}]}"
    
    if ((RANDOM % 2 == 0)); then
        local username=$(echo "$name" | tr '[:upper:]' '[:lower:]' | tr -d ' ')
        echo "${username}@${domain}"
    else
        local username=$(echo "$name" | tr '[:upper:]' '[:lower:]' | tr -d ' ')
        local random_number=$((RANDOM % 1000))
        echo "${username}${random_number}@${domain}"
    fi
}

generate_phone() {
    local providers=("831" "838" "852" "851")
    local provider="${providers[RANDOM % ${#providers[@]}]}"
    echo "+62$provider$((RANDOM % 10000000 + 1000000))"
}

generate_nik() {
    local region_code=("31" "32" "33" "34" "35" "36" "37" "38" "39")
    local region="${region_code[RANDOM % ${#region_code[@]}]}"
    local year=$((RANDOM % 36 + 80))
    local month=$(printf "%02d" $((RANDOM % 12 + 1)))
    local day=$(printf "%02d" $((RANDOM % 28 + 1)))
    local birthdate="${year}${month}${day}"
    local serial_number=$((RANDOM % 1000))
    local gender=$((RANDOM % 2))
    if [[ $gender -eq 1 ]]; then
        serial_number=$((serial_number | 1))
    else
        serial_number=$((serial_number & ~1))
    fi
    echo "${region}${birthdate}${serial_number}"
}

generate_account_number() {
    local banks=("BCA" "BRI" "BNI" "Mandiri")
    local bank="${banks[RANDOM % ${#banks[@]}]}"
    
    case "$bank" in
        "BCA")
            echo "0$(shuf -i 1000000000-9999999999 -n 1)"
            ;;
        "BRI")
            echo "1$(shuf -i 1000000000-9999999999 -n 1)"
            ;;
        "BNI")
            echo "2$(shuf -i 1000000000-9999999999 -n 1)"
            ;;
        "Mandiri")
            echo "3$(shuf -i 1000000000-9999999999 -n 1)"
            ;;
    esac
}

for ((i=0; i<${#citizens[@]}; i++)); do
    echo -ne "${GREEN}Downloading data... ["
    for ((j=0; j<i; j++)); do
        echo -ne "${CYAN}="
    done
    for ((j=i; j<${#citizens[@]}; j++)); do
        echo -ne " "
    done
    echo -ne "${GREEN}] $((i * 100 / ${#citizens[@]}))% complete\r"
    sleep 0.5

    citizen="${citizens[i]}"
    email=$(generate_email "$citizen")
    phone=$(generate_phone)
    nik=$(generate_nik)
    account_number=$(generate_account_number)
    
    echo -e "Nama: $citizen\nEmail: $email\nNo HP: $phone\nNIK: $nik\nNo Rekening: $account_number\n" >> "$output_file"
done

echo -e "${GREEN}Data berhasil diunduh dan disimpan di $output_file"
