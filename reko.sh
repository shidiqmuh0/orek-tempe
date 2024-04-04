# Update
sudo apt-get update
sudo apt-get install build-essential

# Install Rust and Cargo
curl https://sh.rustup.rs -sSf | sh
source $HOME/.cargo/env  # Memperbaharui PATH environment setelah menginstal Rust/Cargo

sleep 5s

# Install Solana CLI
sh -c "$(curl -sSfL https://release.solana.com/v1.18.4/install)"
source $HOME/.cargo/env  # Memperbaharui PATH environment setelah menginstal Solana CLI

sleep 5s

# Pastikan Solana CLI sudah terinstal dengan benar
# Jika pesan ini tetap muncul, coba jalankan perintah berikut:
# source "$HOME/.cargo/env"

PATH="/root/.local/share/solana/install/active_release/bin:$PATH"

sleep 5s

# Install the Ore CLI
cargo install ore-cli

# Create a New Solana Wallet
solana-keygen new

sleep 5s

# Display wallet address and ask user to deposit 0.01 SOL
echo "Please deposit 0.01 SOL to your wallet address and press Enter to continue..."
SOLANA_PUBKEY=$(solana-keygen pubkey)
echo "Wallet Address: $SOLANA_PUBKEY"

read -p "Press Enter to continue after depositing 0.01 SOL..."

sleep 5s

# Check Balance
solana balance

sleep 5s

# Prompt user for Alchemy RPC URL
while true; do
    read -p "Enter Alchemy RPC URL: " ALCHEMY_RPC_URL
    # Verifikasi bahwa URL yang dimasukkan tidak kosong
    if [ -z "$ALCHEMY_RPC_URL" ]; then
        echo "URL cannot be empty. Please try again."
    else
        # Cek apakah URL valid dengan mengirim permintaan ke server (opsional)
        # Jika ingin memeriksa validitas URL secara eksternal, Anda bisa menggunakan curl atau wget
        # Misalnya:
        # if curl --output /dev/null --silent --head --fail "$ALCHEMY_RPC_URL"; then
        # atau
        # if wget --spider --quiet "$ALCHEMY_RPC_URL"; then
        # Anda dapat menggantikan pernyataan di atas dengan yang sesuai dengan preferensi Anda.
        # Jika ingin hanya memastikan bahwa URL bukan kosong, gunakan pernyataan di bawah ini.
        echo "URL entered: $ALCHEMY_RPC_URL"
        break
    fi
done

sleep 5s

# Create HTTP Miner Script
cat <<EOF > oreminer.sh
#!/bin/bash

while true; do
  echo "Running"
  ore --rpc $ALCHEMY_RPC_URL --keypair ~/.config/solana/id.json --priority-fee 10 mine --threads 4
  echo "Exited"
  sleep 5s
done
EOF

# Make Script Executable
chmod +x oreminer.sh

./oreminer.sh
