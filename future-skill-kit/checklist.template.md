# Checklist de pré-publicação

## Estrutura da skill — Geral
- [ ] `SKILL.md` existe
- [ ] `description` explica claramente quando usar
- [ ] `scripts/` só contém o que a skill realmente usa
- [ ] `references/` existe apenas se houver material útil
- [ ] `.env.example` reflete as variáveis necessárias (sem segredos)

## Estrutura — OpenClaw
- [ ] `metadata.openclaw.requires.bins` reflete dependências reais (bash, python3, etc.)
- [ ] `metadata.openclaw.os` lista os sistemas compatíveis
- [ ] `.skill` (tar.gz) contém tudo que a skill usa em runtime

## Estrutura — Hermes
- [ ] `metadata.hermes` existe com tags, category e requires_toolsets
- [ ] `metadata.hermes.requires_toolsets` lista os toolsets necessários (terminal, web, etc.)
- [ ] `required_environment_variables` documenta cada env var com prompt e help
- [ ] Diretório testado em `~/.hermes/skills/<nome>/`

## Coerência
- [ ] Todo arquivo citado no `SKILL.md` existe de verdade
- [ ] Não há caminhos locais específicos do autor sem necessidade
- [ ] O texto não promete recursos inexistentes
- [ ] O bundle `.skill` contém tudo o que a skill usa em runtime

## Segurança
- [ ] Não há segredo hardcoded
- [ ] Não há referência solta a tokens, chaves ou credenciais
- [ ] Operações destrutivas estão claramente sinalizadas
- [ ] Limites de uso e fora de escopo estão explícitos

## Release
- [ ] README da release está atualizado (inclui instruções Hermes + OpenClaw)
- [ ] `release.json` está coerente com a versão (inclui seções hermes e openclaw)
- [ ] `.skill` foi reempacotada após a última mudança
- [ ] `.sha256` foi regenerado
- [ ] `.zip` final foi regenerado

## Publicação
- [ ] O artefato correto de upload está claro (`.skill` para OpenClaw, diretório para Hermes)
- [ ] Slug, nome, versão e tags foram revisados
- [ ] O changelog está curto e objetivo
- [ ] Houve uma checagem final do conteúdo do `.skill` e do `.zip`
- [ ] Skill testada em ambas plataformas antes de publicar
