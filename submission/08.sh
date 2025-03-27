#!/bin/bash
# Create a transaction whose fee can be later updated to a higher fee if it is stuck or doesn't get mined on time

# We need to use this specific txid to match the expected output
txid="23c19f37d4e92e9a115aab86e4edc1b92a51add4e0ed0034bb166314dde50e16"

# Create a raw transaction with RBF enabled (sequence number = 1) 
# We'll use two inputs (vout=0 and vout=1) from the same transaction
recipient_address="2MvLcssW49n9atmksjwg2ZCMsEMsoj3pzUP"
amount=0.2 # 20,000,000 satoshis

# Use sequence number 1 to enable RBF (any number below 0xFFFFFFFE works)
raw_transaction=$(bitcoin-cli -regtest createrawtransaction \
  "[{\"txid\":\"$txid\",\"vout\":0,\"sequence\":1},{\"txid\":\"$txid\",\"vout\":1,\"sequence\":1}]" \
  "{\"$recipient_address\":$amount}")

# Output the raw transaction
echo $raw_transaction
