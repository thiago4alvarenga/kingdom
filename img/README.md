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
(as 17 regeradas do zero no selo v2 em 2026-08-04, com evolução por nível — ver seção abaixo)

### Evolução por nível (2026-08-04)

Cada ativo agora pode ter até 3 imagens, uma por estágio de evolução — o app escolhe sozinho a certa pro nível atual da propriedade (`tierArte`/`caminhosArteAtivo` em `index.html`), com fallback em cadeia pro estágio anterior se a imagem daquele estágio ainda não existir:

| Arquivo | Estágio | Nível da propriedade |
|---|---|---|
| `<id>.jpg` | Nível 1 (recém-erguida) | 1 |
| `<id>_n2.jpg` | Consolidada | 2–3 |
| `<id>_n3.jpg` | Grandiosa | 4+ |

As 17 propriedades já têm os 3 estágios completos.

### Cinco construções de teto (2026-08-04)

`muralhas`, `castelo`, `arsenal_naval`, `mercado`, `catedral` — já em `ATIVOS`, com arte completa (3 estágios cada). Mecânica pensada pra serem sempre a compra mais cara e mais exigente do catálogo: custo acima de qualquer propriedade anterior (150-270, o teto de antes era 135) e múltiplos atributos altos ao mesmo tempo como requisito — nenhuma delas destrava investindo cedo numa coisa só. Detalhe de cada uma no `index.html` (array `ATIVOS`) e prompts de arte em `Direcao de Arte e Prompts.md`.

(nota 2026-07-31: `posto_avancado` deixou de ser propriedade da capital — virou um marco no
hexcrawl, sem arte própria em `img/assets/` por enquanto; a imagem antiga `posto_avancado.jpg`
ficou sem uso.)

## Dica

Os IDs são os mesmos usados no código do app. Ao criar uma carta ou ativo novo, use o `id` que você deu a ele no `index.html` como nome do arquivo de imagem.
