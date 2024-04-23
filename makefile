-include .env

build:; forge build

deploy-anvil:
	forge script script/DeployFundMe.s.sol --rpc-url $(ANVIL_RPC_URL) --private-key $(DEFAULT_ANVIL_KEY) --broadcast --priority-gas-price 1 -vvvv

deploy-ganache:
	forge script script/DeployFundMe.s.sol --rpc-url $(GANACHE_RPC_URL) --private-key $(GANACHE_PRIV_KEY) --broadcast --priority-gas-price 1 -vvvv

deploy-sepolia:
	forge script script/DeployFundMe.s.sol --rpc-url $(SEPOLIA_RPC_URL) --account sepoliaKey --broadcast --priority-gas-price 1 --verify --etherscan-api-key $(ETHERSCAN_API_KEY) -vvvv

fund-fundme:
	forge script script/Interactions.s.sol:FundFundMe --rpc-url $(SEPOLIA_RPC_URL) --sender $(SEPOLIA_ADDR) --account sepoliaKey --broadcast --priority-gas-price 1 -vvvv

withdraw-fundme:
	forge script script/Interactions.s.sol:FundMe --rpc-url $(SEPOLIA_RPC_URL) --sender $(SEPOLIA_ADDR) --account sepoliaKey --broadcast --priority-gas-price 1 -vvvv



# Contract address on Sepolia used - writing down to remind of format

fund-sepolia:
	cast send --rpc-url $(SEPOLIA_RPC_URL) --account sepoliaKey 0xBf98867a0950D64A63BDCB5E5F4B7Ea70Ba07250 "fund()" --value 0.01ether --priority-gas-price 1

storage-sepolia:
	cast storage 0xBf98867a0950D64A63BDCB5E5F4B7Ea70Ba07250 --rpc-url $(SEPOLIA_RPC_URL) --etherscan-api-key $(ETHERSCAN_API_KEY)

withdraw-sepolia:
	cast send --rpc-url $(SEPOLIA_RPC_URL) --account sepoliaKey 0xdc59733BeC6b376d652E63f0bC5EBc32a3c977cF "withdraw()" --priority-gas-price 1
