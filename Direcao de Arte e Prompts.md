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
