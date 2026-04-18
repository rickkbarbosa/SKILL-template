# Future Skill Kit

Kit de referência para criar e empacotar novas skills com menos tropeços.

## Arquivos

- `SKILL.template.md` — molde principal da skill
- `README.template.md` — molde de README para release pública
- `release.template.json` — metadados de release/publicação

## Uso sugerido

1. Copie `SKILL.template.md` para a nova skill.
2. Ajuste nome, description, metadata e recursos reais.
3. Monte a release usando `README.template.md` e `release.template.json`.
4. Gere a `.skill` e depois o `.zip` de release.

## Lembretes

- O `SKILL.md` deve referenciar apenas arquivos que existem.
- Dependências reais devem entrar em `metadata.openclaw.requires.bins`.
- O `.skill` é o artefato principal de publicação.
- O `.zip` é ótimo para backup, revisão e distribuição da release completa.
