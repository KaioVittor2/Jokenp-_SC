// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Importa o padrão ERC20 e o contrato Ownable da OpenZeppelin para gerenciamento de tokens e controle de acesso
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract jokenkpo {

    // 1. Definir que o msg.sender do contrato é o owner
    address public owner;

    constructor(){
        owner = msg.sender;
    }

    // 2. Criar um mapping para armazenar cada jogador
    mapping(uint256 => address) public jogadoresAutorizados;

    // 3. Criar um mapping para armazenar cada jogo
    mapping(uint256 => Jogo) public jogos;

    // Variáveis contadores para acrescentar nos IDs do jogadores e jogos
    uint256 private contadorIDjogadores;
    uint256 private contadorIDjogos;

    // 4. Criar função para Adicionar novos jogadores (require(owner)) (_endereço do jogador)
    function adicionarJogadores (address _novoJogador) public {
        require(msg.sender == owner, "Apenas o dono do contrato pode adicionar jogadores");
        
        // lógica para adicionar o endereço em um novo ID
        jogadoresAutorizados[contadorIDjogadores] = (_novoJogador);
        contadorIDjogadores++;

    }

    // 5. criar um struct para cada jogo, contendo (id, jogador 1, jogador 2, jogada 1, jogada 2, Resultado)
    struct Jogo {
        uint256 id;        
        address jogador1;   
        address jogador2;    
        string jogada1; 
        string jogada2;      
        string resultado;   
    }

    // 6. Criar função iniciar um jogo (cria um novo jogo com novo ID) (_jogada1 e _desafiado) (require(endereçoValidado))
    function iniciarUmJogo (string memory _jogada1, address _desafiado) public {
        //require(msg.sender == owner, "Apenas jogadores autorizados podem jogar");
        //require(_jogada 1 == "pedra" | "papel" | "tesoura", "Escolha entre pedra, papel ou tesoura"); //a jogada só pode ser "pedra", "papel" ou "tesoura"
        


        // cria um novo jogo
        jogos[contadorIDjogos] = Jogo({
            id: contadorIDjogos,
            jogador1: msg.sender,
            jogador2: _desafiado,
            jogada1: _jogada1,
            jogada2: "saguardando jogada",
            resultado: "sem ganhador ainda"
        });
        contadorIDjogos++;
    }

    // 7. Criar função jogar um jogo (busca um jogo pelo ID) (_id, _jogada) (require(endereçoValidado))
    function jogarUmJogo(uint _id, string memory _jogada2) public {
        //require(msg.sender == owner, "Apenas jogadores autorizados podem jogar");
        //require(msg.sender == jogos[_id]jogador2, "Apenas o jogadore desafiado pode jogar");
        //require(_jogada 1 == "pedra" | "papel" | "tesoura", "Escolha entre pedra, papel ou tesoura"); //a jogada só pode ser "pedra", "papel" ou "tesoura"

        //escolhe o jogo que quer jogar pelo id
        jogos[_id].jogada2 = _jogada2;
        jogos[_id].jogador2 = msg.sender;

        //define quem é o vencedor
        //if (jogos[_id].jogada1 == pedra & jogos[_id].jogada2 == papel);
        //    jogos[_id].resultado = "Jogador 2 Vencedor";

        //if (jogos[_id].jogada1 == pedra & jogos[_id].jogada2 == papel);
        //jogos[_id].resultado = "Jogador 2 Vencedor";
    }

}