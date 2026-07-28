-- Kingdom — configuração do banco (rode no SQL Editor do projeto Kingdom)
-- Cria a tabela de reinos, ativa RLS com políticas públicas (jogo colaborativo por código de sala)
-- e habilita atualização ao vivo (realtime).

create table if not exists public.kingdom_reinos (
  codigo      text primary key,
  data        jsonb not null,
  updated_at  timestamptz not null default now()
);

alter table public.kingdom_reinos enable row level security;

-- Políticas: qualquer um com a publishable key + o código da sala pode ler e escrever.
-- (Suficiente para protótipo; dá para restringir depois, ex.: só o mestre escreve.)
drop policy if exists "kingdom_select" on public.kingdom_reinos;
drop policy if exists "kingdom_insert" on public.kingdom_reinos;
drop policy if exists "kingdom_update" on public.kingdom_reinos;

create policy "kingdom_select" on public.kingdom_reinos for select using (true);
create policy "kingdom_insert" on public.kingdom_reinos for insert with check (true);
create policy "kingdom_update" on public.kingdom_reinos for update using (true) with check (true);

-- Realtime (atualização ao vivo). Se já estiver na publicação, ignore o erro.
alter publication supabase_realtime add table public.kingdom_reinos;
