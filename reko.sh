# Install Rust and Cargo
curl https://sh.rustup.rs -sSf | sh
source $HOME/.cargo/env  # Memperbaharui PATH environment setelah menginstal Rust/Cargo

# Install Solana CLI
sh -c "$(curl -sSfL https://release.solana.com/v1.18.4/install)"
source $HOME/.cargo/env  # Memperbaharui PATH environment setelah menginstal Solana CLI

# Pastikan Solana CLI sudah terinstal dengan benar
# Jika pesan ini tetap muncul, coba jalankan perintah berikut:
# source "$HOME/.cargo/env"

PATH="/root/.local/share/solana/install/active_release/bin:$PATH"

# Create a New Solana Wallet
solana-keygen new

# Display wallet address and ask user to deposit 0.01 SOL
echo "Please deposit 0.01 SOL to your wallet address and press Enter to continue..."
SOLANA_PUBKEY=$(solana-keygen pubkey)
echo "Wallet Address: $SOLANA_PUBKEY"

sleep 1m

read -p "Press Enter to continue after depositing 0.01 SOL..."

# Check Balance
solana balance

# Install the Ore CLI
cargo install ore-cli

# Prompt user for Alchemy RPC URL
read -p "Enter Alchemy RPC URL: " ALCHEMY_RPC_URL

# Create HTTP Miner Script
cat <<EOF > oreminer.sh
#!/bin/bash

while true; do
  echo "Running"
  ore --rpc $ALCHEMY_RPC_URL --keypair ~/.config/solana/id.json --priority-fee 10 mine --threads 4
  echo "Exited"
done
EOF

# Make Script Executable
chmod +x oreminer.sh

./oreminer.sh
