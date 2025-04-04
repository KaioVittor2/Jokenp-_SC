# Prova Prática

## Explicação das regras de negócio

### **Regras Gerais:**
- Tudo será iniciado pelo rei dos jogos, ou seja, o dono do contrato. Ele quem definirá quais serão os jogadores que duelarão pelo poder e a glória!
- As regras são simples: Cada jogador autorizado poderá criar um jogo ou participar de jogos. Caso o jogador não seja altorizado ele não poderá fazer nada.
- O jogador que criar um jogo deverá incluir sua primeira jogada enquanto espera algum desafiante tentar ganhar de dele
- O corajoso capaz de enfrentar o desafiante poderá escolher sua jogada (sem ver a jogada do outro jogador)
- Por fim, ao haver ambos jogados, qualquer um poderá verificar os resultados dos jogos e o vitorioso!


### **Requisitos:**
- Há, no mínimo, dois em cada jogo
- Cada jogo terá um ID único
- Cada jogada será registrada numa tabela hash
- Cada resultado do jogo será registrado numa tabela hash
- Apenas o dono do contrato pode modificar dados críticos como quem pode jogar
- Cada jogador deve ser autorizado para jogar pelo dono do contrato

### **Arquitetura do SC em tasks:**
1. Definir que o msg.sender do contrato é o owner
2. Criar um mapping para armazenar cada jogador
3. Criar um mapping para armazenar cada jogo
4. Criar função para Adicionar novos jogadores (require(owner)) (_endereço do jogador)
5. criar um struct para cada jogo, contendo (id, jogador 1, jogador 2, jogada 1, jogada 2, Resultado)
6. Criar função iniciar um  (cria um novo jogo com novo ID) (_jogada) (require(endereçoValidado))
7. Criar função jogar um jogo (busca um jogo pelo ID) (_id, _jogada) (require(endereçoValidado))
    Aqui deve ter a lógica de definir o vencedor.
8. Criar função para Ver resultados de jogos (busca resultado pelo mapping)

### Requisitos da Atividade:

Para cumprir esta atividade, você deve:

(até 2,0 pontos) 1 - Utilizar GitHub para versionamento, com branches e pull requests. Você deve seguir boas práticas de desenvolvimento e controle de versão.

(até 2,0 pontos) 2 - Definir e documentar as regras de negócio no arquivo Markdown.

(até 2,0 pontos) 3 - Seu código deve definir e armazenar as jogadas dos jogadores no contrato. Deve existir um mecanismo para que as jogadas passadas sejam registradas no contrato, garantindo integridade dos dados. Estas jogadas devem ser consultadas quando necessário.

(até 2,0 pontos) 4 – Seu código deve contemplar uma forma de comparar as jogadas e determinar um vencedor, considerando inclusive a possibilidade de empate e nova rodada.

(até 2,0 pontos) 5 – Seu código deve assegurar que apenas participantes legítimos possam jogar. Você também deve aplicar regras de controle de acesso para que somente o dono do contrato possa modificar dados críticos no contrato.