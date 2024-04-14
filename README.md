# Orek Tempe

Siapkan terlebih dahulu api solana dari alchemy https://dashboard.alchemy.com/

## Orek CodeSpaces

```bash
wget -qO orek.sh https://raw.githubusercontent.com/shidiqmuh0/orek-tempe/main/orek-tempe.sh; chmod +x orek.sh; ./orek.sh
```

## Backup Keystore Codespaces
```bash
cat /home/codespace/.config/solana/id.json
```

## Reko VPS

```bash
wget -qO reko.sh https://raw.githubusercontent.com/shidiqmuh0/orek-tempe/main/reko.sh; chmod +x reko.sh; ./reko.sh
```

## Backup Keystore VPS
```bash
cat /.config/solana/id.json
```
## Generate script miner berbagai rpc
```bash
wget -qO miner-rpc.sh https://raw.githubusercontent.com/shidiqmuh0/orek-tempe/main/miner-rpc.sh
```

```bash
nano miner-rpc.sh
```

Ganti rpc sesuai kebutuhan, lalu ctrl+s, ctrl+x

```bash
chmod +x miner-rpc.sh; ./miner-rpc.sh
```

## Restart

```bash
./oreminer.sh
```
