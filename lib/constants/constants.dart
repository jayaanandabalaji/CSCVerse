class SolidityContracts {
  static const contractAddress = "0x12668D79D53Cc9634712DC2e9C8fA9C0879C735C";

  static const contract = '''[
			{
				"constant": true,
				"inputs": [],
				"name": "getBalance",
				"outputs": [
					{
						"name": "balance",
						"type": "uint256"
					}
				],
				"payable": false,
				"stateMutability": "view",
				"type": "function"
			},
			{
				"constant": false,
				"inputs": [
					{
						"name": "amount",
						"type": "uint256"
					}
				],
				"name": "withdraw",
				"outputs": [
					{
						"name": "balance",
						"type": "uint256"
					}
				],
				"payable": false,
				"stateMutability": "nonpayable",
				"type": "function"
			},
			{
				"constant": true,
				"inputs": [
					{
						"name": "",
						"type": "address"
					}
				],
				"name": "accounts",
				"outputs": [
					{
						"name": "owner",
						"type": "address"
					},
					{
						"name": "balance",
						"type": "uint256"
					},
					{
						"name": "colors",
						"type": "string"
					}
				],
				"payable": false,
				"stateMutability": "view",
				"type": "function"
			},
			{
				"constant": true,
				"inputs": [],
				"name": "getColors",
				"outputs": [
					{
						"name": "colors",
						"type": "string"
					}
				],
				"payable": false,
				"stateMutability": "view",
				"type": "function"
			},
			{
				"constant": false,
				"inputs": [],
				"name": "createAccount",
				"outputs": [
					{
						"name": "success",
						"type": "bool"
					}
				],
				"payable": false,
				"stateMutability": "nonpayable",
				"type": "function"
			},
			{
				"constant": false,
				"inputs": [
					{
						"name": "amount",
						"type": "uint256"
					}
				],
				"name": "deposit",
				"outputs": [
					{
						"name": "balance",
						"type": "uint256"
					}
				],
				"payable": false,
				"stateMutability": "nonpayable",
				"type": "function"
			},
			{
				"constant": false,
				"inputs": [
					{
						"name": "color",
						"type": "string"
					}
				],
				"name": "purchaseColor",
				"outputs": [
					{
						"name": "colors",
						"type": "string"
					}
				],
				"payable": false,
				"stateMutability": "nonpayable",
				"type": "function"
			}
		]''';
}
