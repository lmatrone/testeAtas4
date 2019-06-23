<!DOCTYPE html>
    <html lang="pt">
    <head>

        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <title>Sistema de Consulta e Registro de Atas</title>

    </head>

    <body>
        <div class="container-fluid bg-2 text-center">
    
            <h1> <font face="Calibri">Consulta de Deliberações Societárias </font> </h1>
            <h2> <font face="Calibri"><b>ABC Brasil S.A.</b></font></h2>
            <h2><font face="Calibri"><font size="4"><b>Contract hash:</b> 0x9593b9c84d47401146554e9d0233cfd7a35883f9</font></h2>
        </div>
            <br>
            <h2><font face="Calibri">Registrar Atas de Reunião</font></h2>
            <br>
            <div id="registro">
                <form action="#" method="POST" name="formRegistro" id="formRegistro">
                    <div>
                        <label for="pauta"><font face="Calibri">Pauta da reunião: </font></label>
                        <input type="text" name="pauta" id="pauta" size="80" />
                    </div>
                    <div>
                        <label for="decisao"><font face="Calibri">Deliberações: </font></label>
                        <input type="text" name="decisao" id="decisao" size="80" />
                    </div>
                    <div>
                        <label for="data"><font face="Calibri">Data da Reunião: </font></label>
                        <input type="date" name="data" id="data" />
                    </div>
          
                    <div>
                        <button onclick="ArquivarAta()" class="btn btn-danger"><span class="glyphicon glyphicon-th"> <font face="Calibri">  GRAVAR</span></font></button>
                    </div>
                </form>
                <br>
                <div>
                    <div id="statusTransacao">&nbsp;</div>
              <br>
            <h2><font face="Calibri">Acessar resumo das decisões</font></h2>
            <div id="decisao">
                <form action="#" method="get" name="formPesquisa" id="formPesquisa">
                    <div>
                        <label for="numeroAta"><font face="Calibri">Informe o número de Ata de Reunião: </font></label>
                        <input type="number" name="numeroAta" id="numeroAta" />
                    </div>
                    <div>
                    <button onclick="consultarDecisoes()" class="btn btn-primary"><span class="glyphicon glyphicon-search"><font face="Calibri">  CONSULTAR</font></span></button>
                    </div>
                <br>
                </form>
                <div id="resultadoPesquisa"></div>

                <h2><font face="Calibri">Busca por Data</font></h2>
                <div id="data">
                    <form action="#" method="get" name="formPesquisa1" id="formPesquisa1">
                        <div>
                            <label for="_data"><font face="Garamond">Informe a Data da Reunião: </font></label>
                            <input type="date" name="_data" id="_data" />
                        </div>
                        <div>
                        <button onclick="buscaPorData()" class="btn btn-primary"><span class="glyphicon glyphicon-search"><font face="Calibri">  CONSULTAR</font></span></button>
                        </div>
                    </form>
                    <div id="resultadoPesquisa1"></div>
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="connectToSmartContract.js"></script>
        <script src="abi.js"></script>
        <script>
            var frmPesquisa = document.formPesquisa;
            function consultarDecisoes() {
                event.preventDefault();
                $("#resultadoPesquisa").html("");
                contract.ConsultaDeliberacoesConselho(frmPesquisa.numeroAta.value, function (erro, resultado) {
                    if (erro) {
                        console.log("consultarDecisoes");
                        console.error(erro);
                        alert("Ata inexistente ou não registrada");
                        frmPesquisa.numeroAta.value = "";
                        return
                    }
                    $("#resultadoPesquisa").html("Resumo das deliberações: " + resultado);
                })
            }

            var frmPesquisa1 = document.formPesquisa1;
            function buscaPorData() {
                event.preventDefault();
                $("#resultadoPesquisa1").html("");
                contract.buscaPorData(frmPesquisa1._data.value, function (erro, resultado) {
                    if (erro) {
                        console.log("consultarDecisoes");
                        console.error(erro);
                        alert("Ata inexistente ou não registrada");
                        formPesquisa1._data.value = "";
                        return
                    }
                    console.log(resultado);
                    $("#resultadoPesquisa1").html(" Pauta: " + resultado[0] + " Deliberações: " + resultado[1] + " Data: " + resultado[2]);
                })
            }
            
            var frmPesquisa2 = document.formPesquisa2;
            function mostrarNumeroAtas() {
                event.preventDefault();
                $("#resultadoPesquisa2").html("");
                contract.mostrarNumeroAtas(frmPesquisa2, function (erro, resultado) {
                    if (erro) {
                        console.log("mostrarNumeroAtas");
                        console.error(erro);
                        alert("erro na consulta");
                        frmPesquisa.numeroAta.value = "";
                        return
                    }
                    $("#resultadoPesquisa2").html("Número de atas: " + resultado);
                })
            }
            
            var frmRegistro = document.formRegistro;
            function ArquivarAta() {
                event.preventDefault();
                $("#statusTransacao").html("&nbsp;");
                contract.ArquivarAta(frmRegistro.pauta.value, frmRegistro.decisao.value, frmRegistro.data.value, {from: web3.eth.accounts[0], gas: 3000000, value: 0}, function (erro, resultado) {
                    if (erro) {
                        console.log("ArquivarAta");
                        console.error(erro);
                        alert("Ocorreu um erro - documento não registrado");
                        return
                    }
                    waitForTxToBeMined(resultado, "#statusTransacao");
                })
            }
        </script>
    </body>
</html>
                   
