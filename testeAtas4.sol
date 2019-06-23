pragma solidity 0.5.9;

contract DeliberacoesConselhoAdm {
    
    struct AtadeReuniao {
        string pauta;
        string decisao;
        string data;
    }
    
    AtadeReuniao[] public book1;
    mapping(string => AtadeReuniao) public book2;
    
    function ArquivarAta(string memory paramPauta, string memory paramDecisao, string memory paramData) public {
        AtadeReuniao memory novaAta = AtadeReuniao(paramPauta, paramDecisao, paramData);
        book1.push(novaAta);
        book2[paramPauta] = novaAta;
        
    }
    
    function ConsultaDeliberacoesConselho(uint numeroAta) public view returns (string memory) {
        return book1[numeroAta].decisao;
    }
    function buscaPorData(string memory _data) public view returns (string memory, string memory, string memory) {
        uint indice = 0;
        bytes32 hashDataASerBuscada = keccak256(bytes(_data));
        for (indice = 0; indice<book1.length; indice++) {
            AtadeReuniao memory atadeReuniao = book1[indice];
            if (hashDataASerBuscada == keccak256(bytes(atadeReuniao.data))) {
                return (atadeReuniao.pauta, atadeReuniao.decisao, atadeReuniao.data);
            }
        }
    }
    
}
    
