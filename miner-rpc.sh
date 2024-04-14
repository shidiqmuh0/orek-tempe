#!/bin/bash

# Define RPC URLs
rpc_urls=(
"ganti rpcmu"
"ganti rpcmu"
"ganti rpcmu"
"ganti rpcmu"
)

# Loop to create individual scripts
for i in "${!rpc_urls[@]}"; do
  cat <<EOF > "oreminer_$i.sh"
#!/bin/bash

while true; do
  echo "Running with RPC node $i"
  ore --rpc "${rpc_urls[$i]}" --keypair ~/.config/solana/id.json --priority-fee 5000000 mine --threads 4
  echo "Exited"
done
EOF
done

# Make Scripts Executable
chmod +x oreminer_*.sh
