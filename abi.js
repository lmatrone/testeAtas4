const   contractABI = [
	{
		"constant": false,
		"inputs": [
			{
				"name": "paramPauta",
				"type": "string"
			},
			{
				"name": "paramDecisao",
				"type": "string"
			},
			{
				"name": "paramData",
				"type": "string"
			}
		],
		"name": "ArquivarAta",
		"outputs": [],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"constant": true,
		"inputs": [
			{
				"name": "",
				"type": "uint256"
			}
		],
		"name": "book1",
		"outputs": [
			{
				"name": "pauta",
				"type": "string"
			},
			{
				"name": "decisao",
				"type": "string"
			},
			{
				"name": "data",
				"type": "string"
			}
		],
		"payable": false,
		"stateMutability": "view",
		"type": "function"
	},
	{
		"constant": true,
		"inputs": [
			{
				"name": "",
				"type": "string"
			}
		],
		"name": "book2",
		"outputs": [
			{
				"name": "pauta",
				"type": "string"
			},
			{
				"name": "decisao",
				"type": "string"
			},
			{
				"name": "data",
				"type": "string"
			}
		],
		"payable": false,
		"stateMutability": "view",
		"type": "function"
	},
	{
		"constant": true,
		"inputs": [
			{
				"name": "_data",
				"type": "string"
			}
		],
		"name": "buscaPorData",
		"outputs": [
			{
				"name": "",
				"type": "string"
			},
			{
				"name": "",
				"type": "string"
			},
			{
				"name": "",
				"type": "string"
			}
		],
		"payable": false,
		"stateMutability": "view",
		"type": "function"
	},
	{
		"constant": true,
		"inputs": [
			{
				"name": "numeroAta",
				"type": "uint256"
			}
		],
		"name": "ConsultaDeliberacoesConselho",
		"outputs": [
			{
				"name": "",
				"type": "string"
			}
		],
		"payable": false,
		"stateMutability": "view",
		"type": "function"
	}
]
    
    if (network === "4") {
        contractAddress = "0xadb0704d93035935e14166c25bb938fb83d8297c"; 
    
    } else {
    contractAddress = "0xadb0704d93035935e14166c25bb938fb83d8297c"; 
}

contract = web3.eth.contract(contractABI).at(contractAddress);
