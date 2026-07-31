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

Bonança: `prosperidade`, `recurso_valioso`, `heroi_local`, `rumor_viajantes`, `colheita_farta`
Cotidiano: `festival`, `magistrado`, `disputa_terras`, `mapas_antigos`
Crise: `fome`, `desastre`, `bandidos`, `revolta`, `praga_lavoura`, `incendio`

(lista atualizada em 2026-07-31 — os ids antigos `acordo_comercial` e `peregrinos` não existem mais no código, e `rumor_viajantes`/`mapas_antigos`/`colheita_farta`/`praga_lavoura`/`incendio` são novos. Ver `Direcao de Arte e Prompts.md` pros prompts de imagem dessas 15 cartas, já em lotes de 3-4 por imagem gerada.)

## IDs dos ativos — `img/assets/<id>.jpg`

`fazendas`, `taverna`, `forte`, `quartel`, `porto`, `estabulo`, `mina`, `ferreiro`, `cabana_cacador`, `guilda`, `guilda_anoes`, `herbalista`, `templo`, `biblioteca`, `hospital`, `torre_mago`, `armazem`
(todos preenchidos exceto `armazem`, novo — 2026-07-31)

(nota 2026-07-31: `posto_avancado` deixou de ser propriedade da capital — virou um marco no
hexcrawl, sem arte própria em `img/assets/` por enquanto; a imagem antiga `posto_avancado.jpg`
ficou sem uso.)

## Dica

Os IDs são os mesmos usados no código do app. Ao criar uma carta ou ativo novo, use o `id` que você deu a ele no `index.html` como nome do arquivo de imagem.
