# Checklist de pré-publicação

## Estrutura da skill
- [ ] `SKILL.md` existe
- [ ] `description` explica claramente quando usar
- [ ] `metadata.openclaw.requires.bins` reflete dependências reais
- [ ] `scripts/` só contém o que a skill realmente usa
- [ ] `references/` existe apenas se houver material útil

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
- [ ] README da release está atualizado
- [ ] `release.json` está coerente com a versão
- [ ] `.skill` foi reempacotada após a última mudança
- [ ] `.sha256` foi regenerado
- [ ] `.zip` final foi regenerado

## Publicação
- [ ] O artefato correto de upload está claro
- [ ] Slug, nome, versão e tags foram revisados
- [ ] O changelog está curto e objetivo
- [ ] Houve uma checagem final do conteúdo do `.skill` e do `.zip`
