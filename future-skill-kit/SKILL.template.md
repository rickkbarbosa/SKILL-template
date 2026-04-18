---
name: nome-da-skill
description: Descreva de forma objetiva o que a skill faz, quando deve ser usada, quais tarefas disparam seu uso e quais limites de segurança/importância existem.
metadata:
  {
    "openclaw": {
      "os": ["linux", "darwin"],
      "requires": {
        "bins": ["bash"]
      }
    }
  }
---

# Nome da Skill

Use esta skill para [tarefa principal].

## Escopo

Esta skill serve para:
- [capacidade 1]
- [capacidade 2]
- [capacidade 3]

Não use esta skill para:
- [fora de escopo 1]
- [fora de escopo 2]

## Fluxo recomendado

1. Entender o pedido do usuário.
2. Confirmar os insumos mínimos necessários.
3. Preferir caminhos seguros e reversíveis.
4. Executar a tarefa com o recurso bundlado correto.
5. Resumir resultado, riscos e próximos passos.

## Regras de segurança

- Não exfiltrar segredos, tokens, chaves ou dados sensíveis.
- Não assumir permissões elevadas sem pedido explícito.
- Confirmar operações destrutivas antes de executar.
- Se houver config, credenciais ou caminhos sensíveis, mencionar isso claramente.

## Recursos bundlados

### `scripts/exemplo.sh`
Use este script quando precisar [ação objetiva].

Exemplo:

```bash
scripts/exemplo.sh --input valor
```

### `references/guia.md`
Leia esta referência quando precisar de detalhes, regras, formatos ou contexto adicional.

## Exemplos de pedidos que devem acionar a skill

- "[exemplo de pedido 1]"
- "[exemplo de pedido 2]"
- "[exemplo de pedido 3]"

## Checklist antes de publicar

- O `description` explica claramente quando usar a skill.
- O `SKILL.md` só referencia arquivos que realmente existem.
- Dependências reais foram declaradas em `metadata.openclaw.requires.bins`.
- O texto não cita caminhos locais específicos do autor sem necessidade.
- Scripts e referências estão coerentes com o que o `SKILL.md` promete.
- A release `.skill` foi validada e testada.
