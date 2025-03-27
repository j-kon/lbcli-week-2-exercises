# Create a SegWit address.
# Add funds to the address.
# Return only the Address

# Generate a SegWit address (Bech32 format)
segwit_address=$(bitcoin-cli -regtest getnewaddress "" "bech32")

# Add funds to the generated SegWit address
bitcoin-cli -regtest generatetoaddress 101 $segwit_address > /dev/null

# Output only the generated SegWit address
echo $segwit_address
