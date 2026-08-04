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

## Atualização (2026-08-04): hexes com textura (código, sem arte nova) + Lote 3 — as 17 propriedades do zero com evolução por nível, Muralhas e ideias novas

### Hexmap: textura por terreno, feita em código

O v2 foi validado nas cartas, então topei regerar as propriedades do zero — mas antes disso, o hexmap: em vez de esperar arte nova, apliquei uma textura **procedural em SVG** direto no `renderMapa()` (função `terrenoTexturaDefs()`). Cada terreno ganhou um padrão (capim no campo, copas de árvore na floresta, veios de rocha na montanha, ondas na costa, junco no pântano, capim de vento na estepe), desenhado numa variação mais escura/clara da cor que já estava calibrada em `TERRENOS` — zero imagem nova, zero dependência de geração. Hex oculto (fog of war) continua sem textura de propósito, pra não vazar pista do terreno real. Já testei sintaxe e gerei um preview SVG isolado pra você bater o olho antes de abrir o app de verdade.

Se depois de ver isso na mesa você achar que vale a pena ir além do procedural — tiles pintados de verdade por terreno —, o `img/README.md` já reserva `img/hex/<terreno>.jpg` pra isso; é só avisar que eu preparo os prompts desse lote também (campo, floresta, montanha, costa, pântano, estepe — 6 tiles, provavelmente 1 imagem só com os 6 lado a lado).

### Convenção de arquivo pra evolução por nível (já implementada no código)

Como pediu pra refletir a evolução (uma Taverna simples que vai crescendo), toda propriedade agora pode ter até **3 imagens por estágio**, e o app já sabe escolher a certa sozinho:

- `img/assets/<id>.jpg` — **Nível 1** (recém-erguida). É o arquivo que já existe hoje pra 16 das 17 propriedades — nada precisa ser trocado até você gerar os estágios novos.
- `img/assets/<id>_n2.jpg` — **Consolidada** (níveis 2-3).
- `img/assets/<id>_n3.jpg` — **Grandiosa** (nível 4 em diante — como propriedade não tem teto de nível, esse estágio vale pra "4 ou mais").

`caminhosArteAtivo()`/`imgFallback()` tentam o estágio certo pro nível atual e, se o arquivo ainda não existir, descem pro estágio anterior até chegar na base — exatamente como o app já se comporta hoje quando falta uma imagem, só que agora em cadeia. Ou seja: **dá pra gerar aos poucos**, propriedade por propriedade, estágio por estágio, sem nunca deixar o app quebrado no meio do caminho. Já testei no harness (Node) que a escolha de caminho e o fallback funcionam certo.

### Selo de estilo — segue o v2 (já validado nas cartas)

> **Selo de estilo v2 (usar em tudo abaixo):** *black and white pixel art illustration, retro 16-bit game sprite aesthetic, visible pixel blocks with no smooth anti-aliasing, dithered halftone shading limited to pure black, white and 2–3 shades of gray, monochrome woodcut engraving linework, clean white background, no color*

Se na hora de ver o resultado achar que prefere voltar pro v1 (xilogravura/meio-tom, sem o ar de sprite de 16-bit), é só trocar esse trecho pelo selo v1 lá no topo do documento — o resto do prompt (composição, cena) não muda.

### As 17 propriedades — cada uma em 3 estágios (1 imagem por propriedade, 3 painéis lado a lado)

Cada prompt abaixo gera **uma imagem só com 3 vinhetas lado a lado** (nível 1 · consolidada · grandiosa), a mesma construção evoluindo — pra manter a silhueta reconhecível entre os estágios, é melhor gerar as 3 juntas do que separadas. Formato sugerido: proporção final de cada vinheta ~4:3 (é o que `img/README.md` já pede pra `img/assets/`), então a imagem toda sai bem larga (~12:3) — recorta em 3 depois, mesmo pipeline de sempre.

**1. Fazendas** (`fazendas.jpg` / `fazendas_n2.jpg` / `fazendas_n3.jpg`)
> A single wide image divided into three side-by-side square vignette panels showing the same farmstead across three stages of growth, each panel separated by a thin white gutter and hairline border, no bleed between panels, consistent style across all three:
> 1. Left: a tiny single wooden farmhouse beside one small fenced crop field, a low stone well, a scarecrow.
> 2. Center: a working farmstead with a proper barn, a hay cart, an expanded plowed field, a small windmill rising.
> 3. Right: a full grain estate with a stone farmhouse, a tall windmill and grain silo, sprawling tilled fields to the horizon, loaded wagons, livestock pens.
> [selo de estilo v2]

**2. Taverna** (`taverna.jpg` / `taverna_n2.jpg` / `taverna_n3.jpg`)
> Same three-panel layout, the same tavern building evolving across three stages:
> 1. Left: a tiny one-room timber tavern, a simple hanging sign, one barrel by the door.
> 2. Center: a two-story timber-and-stone tavern with a small stable-yard, horses tied outside, warm lantern light in the windows.
> 3. Right: a grand sprawling inn with multiple wings, a courtyard terrace, banners, a crowd of travelers and loaded carts arriving.
> [selo de estilo v2]

**3. Forte** (`forte.jpg` / `forte_n2.jpg` / `forte_n3.jpg`)
> Same three-panel layout, the same fort evolving across three stages:
> 1. Left: a small wooden palisade fort with one watchtower and a barred gate.
> 2. Center: a stone-walled fort with two corner towers and a raised drawbridge, banners flying.
> 3. Right: a full fortress with thick battlements, several towers, a portcullis, siege-ready ramparts.
> [selo de estilo v2]

**4. Quartel** (`quartel.jpg` / `quartel_n2.jpg` / `quartel_n3.jpg`)
> Same three-panel layout, the same barracks evolving across three stages:
> 1. Left: a modest single timber barracks hall beside a tiny drilling yard with one practice dummy.
> 2. Center: a stone barracks with an attached armory shed, soldiers training in formation in a larger yard.
> 3. Right: a full military compound with several barracks buildings, an armory, ranks of soldiers on a parade ground.
> [selo de estilo v2]

**5. Porto** (`porto.jpg` / `porto_n2.jpg` / `porto_n3.jpg`)
> Same three-panel layout, the same port evolving across three stages:
> 1. Left: a small wooden dock with a single fishing boat and a modest shed.
> 2. Center: a stone quay with two merchant ships docked, stacked cargo crates, a small lighthouse rising.
> 3. Right: a bustling harbor with multiple piers, tall-masted trade ships, a working lighthouse, cranes loading cargo.
> [selo de estilo v2]

**6. Estábulos** (`estabulo.jpg` / `estabulo_n2.jpg` / `estabulo_n3.jpg`)
> Same three-panel layout, the same stables evolving across three stages:
> 1. Left: a small open-sided timber stable with one horse.
> 2. Center: an enclosed stable building with a fenced paddock, a few horses and a cart.
> 3. Right: a grand stable complex with multiple paddocks, a riding yard, a falcon perched on a post, a warhorse being fitted with armor.
> [selo de estilo v2]

**7. Mineração** (`mina.jpg` / `mina_n2.jpg` / `mina_n3.jpg`)
> Same three-panel layout, the same mine evolving across three stages:
> 1. Left: a simple mine entrance cut into a hillside, a wooden support beam, one ore cart.
> 2. Center: a developed mine with a wooden headframe and winch, rail tracks, several ore carts.
> 3. Right: a large mining operation with a tall headframe, multiple tunnel entrances, a smelting furnace venting smoke, stacked ore.
> [selo de estilo v2]

**8. Ferreiro** (`ferreiro.jpg` / `ferreiro_n2.jpg` / `ferreiro_n3.jpg`)
> Same three-panel layout, the same forge evolving across three stages:
> 1. Left: a small open-air forge with one anvil under a lean-to roof.
> 2. Center: an enclosed smithy with a proper chimney, tool racks, a small display of basic weapons.
> 3. Right: a grand forge-hall with multiple furnaces, apprentices working, a showroom wall of fine weapons and armor.
> [selo de estilo v2]

**9. Cabana do Caçador** (`cabana_cacador.jpg` / `cabana_cacador_n2.jpg` / `cabana_cacador_n3.jpg`)
> Same three-panel layout, the same lodge evolving across three stages:
> 1. Left: a tiny one-room log cabin, a single pelt hung outside, a bow leaning by the door.
> 2. Center: a bigger log lodge with a drying rack of pelts, hunting trophies on the wall, a dog resting outside.
> 3. Right: a proper hunting lodge with a large trophy hall, several drying racks, hounds, a stocked wall of bows and traps.
> [selo de estilo v2]

**10. Guilda** (`guilda.jpg` / `guilda_n2.jpg` / `guilda_n3.jpg`)
> Same three-panel layout, the same guildhall evolving across three stages:
> 1. Left: a modest single-story guildhall with a simple sign and a small noticeboard.
> 2. Center: a two-story guildhall with a busy noticeboard of postings, a few adventurers gathered outside.
> 3. Right: a grand guild hall with towers and banners of many trades, a bustling courtyard of merchants and adventurers.
> [selo de estilo v2]

**11. Guilda de Anões** (`guilda_anoes.jpg` / `guilda_anoes_n2.jpg` / `guilda_anoes_n3.jpg`)
> Same three-panel layout, the same dwarven hall evolving across three stages:
> 1. Left: a small stone lodge built into a rock face, dwarven runes carved at the entrance.
> 2. Center: a proper dwarven hall with carved stone columns, forge-light glowing from within, ore samples on display.
> 3. Right: a grand dwarven guildhall carved deep into the mountain, a monumental stone archway, glowing forges, dwarven banners.
> [selo de estilo v2]

**12. Herbalista** (`herbalista.jpg` / `herbalista_n2.jpg` / `herbalista_n3.jpg`)
> Same three-panel layout, the same herbalist's home evolving across three stages:
> 1. Left: a small thatched hut with herbs drying outside, a modest garden patch.
> 2. Center: a proper herbalist's cottage with a larger garden, jars visible through the window, a small greenhouse beginning.
> 3. Right: a grand apothecary house with a sprawling botanical garden, a greenhouse, countless hanging herb bundles and jars.
> [selo de estilo v2]

**13. Templo** (`templo.jpg` / `templo_n2.jpg` / `templo_n3.jpg`)
> Same three-panel layout, the same temple evolving across three stages:
> 1. Left: a small wooden shrine with a single carved symbol and a modest altar.
> 2. Center: a stone chapel with a bell tower, a hint of stained glass, a small congregation gathering.
> 3. Right: a grand cathedral-like temple with towering spires, an ornate façade, a large gathered crowd.
> [selo de estilo v2]

**14. Biblioteca** (`biblioteca.jpg` / `biblioteca_n2.jpg` / `biblioteca_n3.jpg`)
> Same three-panel layout, the same library evolving across three stages:
> 1. Left: a small single-room study with a few shelves and one desk with a candle.
> 2. Center: a proper library building with tall shelves, a reading room, a scholar at a lectern.
> 3. Right: a grand archive tower with soaring shelves, a spiral staircase, scholars and mages studying, a domed observatory hinted above.
> [selo de estilo v2]

**15. Hospital** (`hospital.jpg` / `hospital_n2.jpg` / `hospital_n3.jpg`)
> Same three-panel layout, the same infirmary evolving across three stages:
> 1. Left: a small wooden infirmary hut, one cot, a healer tending a patient.
> 2. Center: a proper stone hospital building with several beds, herb-drying racks, a small healer's garden.
> 3. Right: a grand hospital complex with multiple wards, a chapel wing, healers and clergy tending many patients.
> [selo de estilo v2]

**16. Torre do Mago** (`torre_mago.jpg` / `torre_mago_n2.jpg` / `torre_mago_n3.jpg`)
> Same three-panel layout, the same tower evolving across three stages:
> 1. Left: a small modest stone tower with a single glowing window.
> 2. Center: a taller tower with an observatory platform, arcane runes carved into the stone, a faint magical glow.
> 3. Right: a grand spiraling arcane tower with multiple glowing windows, a floating arcane apparatus orbiting the top, crackling magical energy.
> [selo de estilo v2]

**17. Armazém** (`armazem.jpg` / `armazem_n2.jpg` / `armazem_n3.jpg`)
> Same three-panel layout, the same warehouse evolving across three stages:
> 1. Left: a small single-room timber storehouse with a few crates and sacks.
> 2. Center: a proper warehouse with stacked crates and barrels, a loading platform.
> 3. Right: a sprawling warehouse complex with multiple storage buildings, a busy loading yard with carts and porters.
> [selo de estilo v2]

### Muralhas — mecânica decidida (2026-08-04)

Já está em `ATIVOS`: custo 150, +1 Militar/+1 Moral por nível, exige Militar 3 e População 5 pra começar a construir, upkeep 1.3. Diferencial dela sobre Forte/Quartel: com Muralhas ativas (mão de obra alocada), `checarSaques()` corta a perda de Tesouro de um saque pela metade — Forte/Quartel só sobem Militar (evitam o saque de acontecer), Muralhas amenizam o estrago quando ele já aconteceu.

**Muralhas** (`muralhas.jpg` / `muralhas_n2.jpg` / `muralhas_n3.jpg`)
> Same three-panel layout, the same settlement wall evolving across three stages:
> 1. Left: a simple wooden palisade fence encircling a small village, one plain gate.
> 2. Center: a stone wall with crenellations and a watchtower at intervals, a reinforced gatehouse.
> 3. Right: a grand fortified wall with tall towers, murder holes, banners flying, a massive reinforced double gatehouse.
> [selo de estilo v2]

### Outras propriedades novas — mecânica decidida (2026-08-04)

Você citou Castelo e Porto — o Porto já existe (coberto acima); pra "porto grande" a ideia mais natural foi um Arsenal Naval separado (estaleiro/frota de guerra), diferente do porto comercial. As duas ideias bônus (Mercado, Catedral) também entraram em `ATIVOS`. As cinco (Muralhas + estas quatro) têm uma coisa em comum, de propósito: custo acima de qualquer propriedade anterior (o teto era 135, Torre do Mago) e múltiplos atributos altos ao mesmo tempo como requisito — nenhuma dá pra destravar cedo investindo só numa coisa.

**Castelo** (`castelo.jpg` / `castelo_n2.jpg` / `castelo_n3.jpg`) — custo 270 (a mais cara do jogo), +2 Militar/+1 Influência/+1 Moral por nível, exige Militar 6 + Influência 3 + Economia 6, upkeep 2.2. Teto da capital, acima do Forte.
> Same three-panel layout, the same castle evolving across three stages:
> 1. Left: a modest fortified manor house with a single squat tower and a small keep.
> 2. Center: a proper castle with two towers, a curtain wall, a drawbridge over a moat.
> 3. Right: a grand castle complex with soaring towers, multiple wards, banners flying, a magnificent gatehouse — the true seat of a kingdom.
> [selo de estilo v2]

**Arsenal Naval** (`arsenal_naval.jpg` / `arsenal_naval_n2.jpg` / `arsenal_naval_n3.jpg`) — custo 195, +1 Militar/+1 Economia por nível, exige Economia 7 + Militar 3, upkeep 1.6. Evolução militar do Porto, frota de guerra.
> Same three-panel layout, the same shipyard evolving across three stages:
> 1. Left: a small shipwright's yard with a single half-built rowboat and scattered timber.
> 2. Center: a shipyard with a mid-size galley under construction, timber stacks, a simple crane.
> 3. Right: a grand naval arsenal with multiple warships under construction or repair in dry docks, tall cranes, naval banners flying.
> [selo de estilo v2]

**Mercado** (`mercado.jpg` / `mercado_n2.jpg` / `mercado_n3.jpg`) — custo 150, +2 Economia/+1 Influência por nível, exige Economia 6 + População 6, upkeep 1. Praça de comércio, diferente da lojinha da Taverna.
> Same three-panel layout, the same marketplace evolving across three stages:
> 1. Left: a single humble market stall with a few baskets of goods.
> 2. Center: a small row of market stalls in a square, a handful of merchants and buyers haggling.
> 3. Right: a grand bustling market square packed with stalls and awnings, crowds of merchants and traders, exotic goods on display.
> [selo de estilo v2]

**Catedral** (`catedral.jpg` / `catedral_n2.jpg` / `catedral_n3.jpg`) — custo 180, +1 Influência/+2 Moral por nível, exige Influência 4 + Economia 5 (o requisito não pode usar Moral — `reqAttr` só entende os 4 atributos do reino, não medidores), upkeep 1.5. Teto do Templo.
> Same three-panel layout, the same religious building evolving across three stages (this one can reuse the Templo's first two stages if you'd rather not regenerate them — it's meant as an optional fourth stage above Templo's own nível 3):
> 1. Left: (skip — reuse Templo estágio 1, a small wooden shrine).
> 2. Center: (skip — reuse Templo estágio 2/3, a stone chapel or the cathedral already made above).
> 3. Right: an immense cathedral with soaring twin spires, flying buttresses, stained glass windows glowing, a vast crowd filling the plaza before it.
> [selo de estilo v2]

### Depois de gerar

Mesmo fluxo de sempre: manda os arquivos (sheet inteira ou já recortada, como preferir) que eu recorto, salvo em `img/assets/` com o nome certo de cada estágio (`<id>.jpg` / `<id>_n2.jpg` / `<id>_n3.jpg`) e confirmo no harness que o app escolhe a imagem certa pra cada nível. Não precisa gerar tudo de uma vez — dá pra ir propriedade por propriedade, e até só o estágio 1 de uma propriedade nova (Muralhas, Castelo etc.) já é suficiente pra ela aparecer decente assim que a mecânica dela for definida e ela entrar em `ATIVOS`.
