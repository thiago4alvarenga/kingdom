# Imagens do Kingdom

O app procura as imagens por caminho e nome fixos. Enquanto o arquivo não existe, aparece um **placeholder** com o caminho esperado — é só soltar a imagem no lugar certo com o nome certo e ela aparece.

## Onde vai cada coisa

| Pasta | Para quê | Nome do arquivo | Proporção sugerida |
|---|---|---|---|
| `img/cards/` | Frente das cartas de evento | `<id-da-carta>.jpg` | 16:10 (paisagem) |
| `img/decks/` | Verso de cada baralho | `bonanca.jpg`, `cotidiano.jpg`, `crise.jpg` | 3:4 (retrato) |
| `img/assets/` | Arte dos ativos/construções | `<id-do-ativo>.jpg` | 4:3 |
| `img/hex/` | Tiles de terreno do hexcrawl | `<terreno>.jpg` | 1:1 ou hexagonal |

## IDs das cartas (frente) — `img/cards/<id>.jpg`

Bonança: `prosperidade`, `recurso_valioso`, `heroi_local`, `acordo_comercial`
Cotidiano: `disputa_terras`, `festival`, `peregrinos`, `magistrado`
Crise: `desastre`, `revolta`, `fome`, `bandidos`

## IDs dos ativos — `img/assets/<id>.jpg`

`fazendas`, `taverna`, `forte`, `quartel`, `porto`, `mina`, `ferreiro`, `guilda`, `templo`, `hospital`
(já preenchidos com as ilustrações que estavam na pasta do projeto)

## Dica

Os IDs são os mesmos usados no código do app. Ao criar uma carta ou ativo novo, use o `id` que você deu a ele no `index.html` como nome do arquivo de imagem.
