# Kingdom App — Direção de Arte e Prompts de Imagem

## Por que o app ainda parece planilha

A paleta de cores do `Kingdom App` já está no caminho certo (fundo marrom escuro, dourado de destaque, painéis diferenciados) — o problema não é a cor, é a ausência de textura e ornamento. Três coisas empurram o visual pro lado "dashboard/Excel":

1. **Tipografia genérica**: o body inteiro usa a pilha padrão do sistema (`-apple-system, Segoe UI, Roboto...`), a mesma fonte de qualquer painel administrativo.
2. **Painéis sem textura nem moldura**: `.panel` é só um retângulo de cor sólida com cantos arredondados e uma borda de 1px — nenhuma referência visual a pergaminho, madeira ou pedra.
3. **Brasão-placeholder**: o `<div class="crest">` no cabeçalho é literalmente o caractere `♜` (peça de xadrez) dentro de uma caixinha cinza — não existe brasão de verdade ainda.

O bom é que os ícones de construção que você já colocou em `img/assets/` (forte.jpg, taverna.jpg etc.) têm um estilo bem definido e forte: **ilustração monocromática (preto/branco/cinza) em pixel art com sombreamento dithered, feito parecendo xilogravura/gravura em madeira, fundo branco/transparente, vista de 3/4**. Esse estilo é ótimo — só falta estender ele pro resto da interface (molduras, texturas, ícones decorativos), em vez de deixar as construções como as únicas coisas "artísticas" da tela.

## O que eu já posso ajustar sem imagem nova (CSS puro)

Se quiser, eu aplico isso direto no `index.html` sem depender de nenhuma arte gerada:

- Trocar a fonte de títulos (`h1`, `h2`, `.panel h2`) por uma serifada/display de clima medieval via Google Fonts — candidatas: **Cinzel** (grave, monumental, boa pra títulos de reino) ou **Almendra SC** (mais "manuscrito antigo"). O corpo do texto continua legível numa fonte normal, só o cabeçalho muda.
- Trocar os cantos arredondados uniformes por bordas mais ornamentadas (dupla linha, cantos em ângulo em vez de `border-radius`).
- Adicionar uma leve textura de ruído/grão no fundo via CSS (gradiente + `background-blend-mode`), sem precisar de arquivo de imagem.

Isso já tira uma boa parte do "ar de painel administrativo" antes mesmo de você gerar qualquer imagem nova. Me avisa se quer que eu aplique essas três coisas agora como um primeiro passo.

## Prompts de imagem (pra você gerar do seu lado)

Todos os prompts abaixo terminam com o mesmo "selo de estilo" — cole esse trecho fixo no final de qualquer prompt pra manter a arte nova consistente com as construções que você já tem:

> **Selo de estilo (sempre incluir):** *black and white pixel art illustration, dithered halftone shading, monochrome woodcut engraving style, high detail, clean white or transparent background, no color*

### 1. Textura de fundo (pergaminho/papel)
> Old aged parchment paper texture, subtle stains and fiber grain, seamless tileable pattern, worn edges, [selo de estilo]

### 2. Moldura ornamentada de painel
> Ornate rectangular frame border with medieval corner flourishes, four separate corner pieces plus straight edge segments (for a 9-slice UI border), carved wood or stone relief style, [selo de estilo]

### 3. Brasão genérico do reino (substituir o `♜`)
> Heraldic shield crest, blank/generic center for a coat of arms, medieval kingdom emblem, symmetrical ornamental design, [selo de estilo]

### 4. Faixa/banner decorativo pra títulos de seção
> Decorative ribbon banner scroll, unfurled parchment ribbon with pointed ends, empty center for text, medieval heraldic style, [selo de estilo]

### 5. Divisor ornamentado (separador de seção)
> Horizontal ornamental divider line with a small flourish or crest in the center, symmetrical, thin decorative border element, [selo de estilo]

### 6. Selo de cera (eventos/conquistas)
> Wax seal stamp, circular, ornate emblem pressed into wax, hanging ribbon optional, medieval document seal, [selo de estilo]

### 7. Textura de fundo do mapa hexagonal
> Aged topographic parchment map texture, faint terrain contour lines, subtle compass rose in a corner, seamless background for a hex grid overlay, [selo de estilo]

### 8. Ícone de tesouro/moedas
> Small pile of coins with a satchel or chest, treasury icon, single game-asset icon on white background, [selo de estilo]

### 9. Conjunto de ícones de clima/estação
> Set of four small weather icons (sun for summer, falling leaves for autumn, snowflake for winter, rain cloud for spring), each on its own white background, consistent icon size, [selo de estilo]

### 10. Ícones de recurso genéricos (se fizer falta no `.meter`)
> Small icon set: grain sheaf (food), wood log (timber), ore chunk (stone/metal), banner (population) — each a separate simple icon, white background, [selo de estilo]

## Como aplicar depois que as artes estiverem prontas

Quando você tiver os arquivos, é só me avisar — eu:
1. Salvo cada imagem em `Kingdom App/img/` num subpasta (ex: `img/ui/`).
2. Troco o CSS pra usar a textura de fundo, a moldura nos `.panel`, o brasão no lugar do `♜`, etc.
3. Testo se nada quebrou (o app não depende de imagem nenhuma pra funcionar, então é seguro trocar aos poucos).

Isso pode ser feito em etapas — não precisa ter todas as 10 artes prontas de uma vez pra eu começar a encaixar.

## Atualização (2026-07-31): selo de estilo v2 — mais pixelizado, e cartas de evento em lote

O Thiago achou que o estilo devia puxar mais forte pro pixel art de verdade (o v1 já é bom, mas lê mais como gravura em xilogravura com meio-tom do que como pixel art propriamente dito) e pediu pra reconsiderar isso em tudo, inclusive nas propriedades já prontas. Antes de gastar geração regerando as 17 construções, o mais barato é testar o selo v2 num lote pequeno primeiro (as cartas de evento, que ainda não têm nenhuma arte) e só depois decidir se vale reprocessar as propriedades também.

> **Selo de estilo v2 (usar nas cartas de evento abaixo):** *black and white pixel art illustration, retro 16-bit game sprite aesthetic, visible pixel blocks with no smooth anti-aliasing, dithered halftone shading limited to pure black, white and 2–3 shades of gray, monochrome woodcut engraving linework, clean white background, no color*

O v1 (sem o trecho "retro 16-bit / visible pixel blocks / paleta limitada") continua valendo pra qualquer arte que já esteja no ar — só o v2 é novo, específico pra este lote de teste.

### Cartas de evento — 15 cartas, em 4 imagens (3-4 cartas por imagem)

O app já espera essas imagens em `img/cards/<id>.jpg` (proporção 16:10, ver `img/README.md`) — é só gerar, recortar e salvar com o nome certo que elas aparecem sozinhas, sem eu mexer em código nenhum. Cada prompt abaixo pede um quadro 2×2 com uma vinheta por célula, uma margem branca fina entre as células pra dar pra recortar limpo depois (o Sheet D usa só 3 das 4 células, a quarta fica em branco — descarte esse pedaço).

**Sheet A — Bonança (prosperidade, recurso_valioso, heroi_local, rumor_viajantes)**
> A single image divided into a clean 2×2 grid of four separate square vignette illustrations, each cell separated by a thin white gutter and a faint hairline border so the panels can be cropped apart afterward, no artwork bleeding between cells, same art style applied identically to all four panels:
> 1. Top-left: an overflowing grain barn bursting with stacked wheat sacks, doors thrown open, abundant harvest.
> 2. Top-right: a glittering mineral vein exposed in a rocky cliffside beyond a border marker, a pickaxe leaning nearby, scout footprints in the dirt.
> 3. Bottom-left: a young villager walking away from a small hilltop village toward misty distant hills, holding a raised simple sword, a small crowd waving farewell behind.
> 4. Bottom-right: a merchant caravan of wagons and traders gathered around a campfire at dusk, one figure pointing toward crumbling ruins on the horizon.
> [selo de estilo v2]

Salvar os 4 recortes como: `prosperidade.jpg`, `recurso_valioso.jpg`, `heroi_local.jpg`, `rumor_viajantes.jpg`.

**Sheet B — Colheita Farta + Cotidiano (festival, magistrado, disputa_terras)**
> A single image divided into a clean 2×2 grid of four separate square vignette illustrations, each cell separated by a thin white gutter and a faint hairline border so the panels can be cropped apart afterward, no artwork bleeding between cells, same art style applied identically to all four panels:
> 1. Top-left: workers harvesting an overflowing wheat field with an oversized bountiful crop, baskets piled full, radiant sun overhead.
> 2. Top-right: a lively village square festival at night, strings of lanterns, dancing townsfolk, food stalls, a bonfire in the center.
> 3. Bottom-left: an elderly robed magistrate holding a gavel and a scale of justice, standing before a grand hall entrance.
> 4. Bottom-right: two armored nobles in a tense standoff facing each other across a boundary marker stone in a shared valley.
> [selo de estilo v2]

Salvar os 4 recortes como: `colheita_farta.jpg`, `festival.jpg`, `magistrado.jpg`, `disputa_terras.jpg`.

**Sheet C — Cotidiano + Crise (mapas_antigos, fome, desastre, bandidos)**
> A single image divided into a clean 2×2 grid of four separate square vignette illustrations, each cell separated by a thin white gutter and a faint hairline border so the panels can be cropped apart afterward, no artwork bleeding between cells, same art style applied identically to all four panels:
> 1. Top-left: a cluttered cartographer's desk covered in unrolled ancient maps and scrolls, a compass, a quill, a single candle burning.
> 2. Top-right: an empty grain barn with snow drifting outside, a thin line of gaunt villagers waiting with empty bowls.
> 3. Bottom-left: a storm-battered village with flooded streets, a collapsed thatched roof, dark rushing floodwater, heavy storm clouds above.
> 4. Bottom-right: a rough bandit stockade camp at a forest's edge, a crude watchtower, a campfire, silhouetted armed figures standing guard.
> [selo de estilo v2]

Salvar os 4 recortes como: `mapas_antigos.jpg`, `fome.jpg`, `desastre.jpg`, `bandidos.jpg`.

**Sheet D — Crise (revolta, praga_lavoura, incendio) — só 3 células, a quarta fica vazia**
> A single image divided into a clean 2×2 grid, but only three of the four cells contain artwork (the fourth cell is left blank white space) — each used cell separated by a thin white gutter and a faint hairline border so the panels can be cropped apart afterward, no artwork bleeding between cells, same art style applied identically to all three used panels:
> 1. Top-left: a torch-lit peasant mob at dusk carrying pitchforks and makeshift banners, raised fists, angry crowd.
> 2. Top-right: a diseased withered farm field with blackened wilted crops and a sickly abandoned livestock pen, ominous low mist.
> 3. Bottom-left: a timber building fully engulfed in flames with thick black smoke, silhouetted figures fleeing or hauling water buckets.
> 4. Bottom-right: leave this cell empty, plain white background, no artwork.
> [selo de estilo v2]

Salvar os 3 recortes como: `revolta.jpg`, `praga_lavoura.jpg`, `incendio.jpg` (descarte o quarto pedaço em branco).

### Depois de gerar

Me manda os 4 arquivos de sheet (ou já recortados, se preferir recortar do seu lado) que eu: recorto certinho (mesmo pipeline de sempre — Pillow, trim por threshold, remove qualquer selo de marca d'água que o gerador colocar), salvo em `img/cards/` com o nome de cada `id`, e confirmo no harness/visualmente que apareceram nos cards certos. Nenhuma mudança de código é necessária — o app já procura essas imagens sozinho.

Se o resultado do selo v2 agradar, o próximo passo natural é regerar as 17 propriedades (`img/assets/`) no mesmo estilo pra ficar tudo consistente — aí sim vale um lote de prompts dedicado só pra elas, do mesmo jeito (3-4 por imagem). Não fiz isso ainda de propósito, pra não gastar geração numa leva grande antes de validar se o v2 é mesmo a direção certa.
