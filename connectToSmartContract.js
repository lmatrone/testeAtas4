
var web3;
var contract;
var network;
var contractAddress;

if (window.ethereum) {
    web3 = new Web3(ethereum);
    try {
        // Solicita acesso a carteira Ethereum se necessário
        ethereum.enable();    
        network = web3.version.network;
    } catch (err) { // Usuário ainda não deu permissão para acessar a carteira Ethereum    
        console.log("erro"); 
        console.error(err);           
    }
}

function waitForTxToBeMined(txHash, objStatus) {
    let txReceipt;
    web3.eth.getTransactionReceipt(txHash, function (err, result) {
        if (err) {
            console.error(err);
            return;
        }        
        txReceipt = result;
        let d = new Date();
        console.log("txHash: " + txHash + " at " + d);
        console.log(txReceipt); 
        if (txReceipt) {
            if (txReceipt.status == "0x1") {
                $(objStatus).css("background-color", "LawnWhite");
                $(objStatus).html("Registrado com sucesso no bloco: " + txReceipt.blockNumber + " - Hash: " + txHash);            
            } else {
                $(objStatus).css("background-color", "Salmon");
                $(objStatus).html("There was an error - Transaction hash: " + txHash + " final status: " + txReceipt.status);            
            }
        } else {
            $(objStatus).css("background-color", "white");
            $(objStatus).text("Aguardando mineração. Hash: " + txHash);
            window.setTimeout(waitForTxToBeMined, 1500, txHash, objStatus);
        }
    });
}
