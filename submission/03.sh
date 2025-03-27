# Create a SegWit address.
# Add funds to the address.
# Return only the Address.

# Create a SegWit address (Bech32 format).
ADDRESS=$(bitcoin-cli -regtest getnewaddress "segwit" bech32)

# Generate some blocks to add funds to the wallet.
bitcoin-cli -regtest generatetoaddress 101 $ADDRESS

# Output only the address.
echo $ADDRESS
