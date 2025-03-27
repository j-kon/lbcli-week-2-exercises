#!/bin/bash

# We need to use this specific txid and create a transaction with two inputs
txid="23c19f37d4e92e9a115aab86e4edc1b92a51add4e0ed0034bb166314dde50e16"

# Create a raw transaction with two inputs (using index 0 and 1)
recipient_address="2MvLcssW49n9atmksjwg2ZCMsEMsoj3pzUP"
amount=0.2 # 20,000,000 satoshis = 0.2 BTC

# Notice we're using two inputs from the same transaction
raw_transaction=$(bitcoin-cli -regtest createrawtransaction \
  "[{\"txid\":\"$txid\",\"vout\":0},{\"txid\":\"$txid\",\"vout\":1}]" \
  "{\"$recipient_address\":$amount}")

# Output the raw transaction
echo $raw_transaction
