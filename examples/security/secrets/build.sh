#!/bin/bash

echo "Building wasmCloud ..."
pushd ../../../
cargo build
popd

echo "Building NATS KV secrets backend..."
pushd ../../../crates/secrets-nats-kv
cargo build
popd

echo "Building application component ..."
wash build -p component-keyvalue-counter-auth

echo "Building application provider ..."
wash build -p provider-keyvalue-redis-auth