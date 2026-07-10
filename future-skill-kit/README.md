# Future Skill Kit

Kit de referência para criar e empacotar novas skills **dual-platform** (Hermes + OpenClaw) com menos tropeços.

## Arquivos

| Arquivo | Função |
|---------|--------|
| `SKILL.template.md` | Molde principal da skill — frontmatter com `metadata.hermes` + `metadata.openclaw` |
| `README.template.md` | Molde de README para release pública |
| `release.template.json` | Metadados de release/publicação (dual-platform) |
| `checklist.template.md` | Checklist de pré-publicação |
| `make-release.template.sh` | Script de automação de release (gera `.skill`, `.zip`, checksum) |

## Dual-platform

Cada skill neste template já vem preparada para funcionar em **Hermes** e **OpenClaw** simultaneamente:

- **Hermes** lê `metadata.hermes` — tags, category, toolsets, required_environment_variables
- **OpenClaw** lê `metadata.openclaw` — OS, bins, install deps
- Ambas plataformas ignoram o namespace da outra — zero conflito

## Uso sugerido

1. Copie `SKILL.template.md` para a nova skill.
2. Ajuste nome, description, version e ambos os `metadata.*` conforme as reais dependências.
3. Adicione scripts em `scripts/` e documentação em `references/`.
4. Monte a release usando `README.template.md` e `release.template.json`.
5. Rode `make-release.template.sh` (ajustado) para gerar `.skill` + `.zip` + checksum.
6. Teste no Hermes: copie o diretório para `~/.hermes/skills/`.
7. Teste no OpenClaw: copie o `.skill` para a workspace.

## Lembretes

- O `SKILL.md` deve referenciar apenas arquivos que existem.
- Dependências reais devem entrar em `metadata.openclaw.requires.bins`.
- Toolsets necessários (terminal, web, browser) devem entrar em `metadata.hermes.requires_toolsets`.
- O `.skill` é o artefato principal de publicação para OpenClaw.
- O diretório da skill é o artefato para Hermes (copiar para `~/.hermes/skills/`).
- O `.zip` é ótimo para backup, revisão e distribuição da release completa.
