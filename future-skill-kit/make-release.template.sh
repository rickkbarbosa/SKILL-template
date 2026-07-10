#!/usr/bin/env bash
# make-release.template.sh
#
# Gera artefatos de release para skill dual-platform (Hermes + OpenClaw).
# Cria: .skill (OpenClaw), release folder, .sha256, .zip final.
#
# Uso:
#   1. Ajuste SKILL_NAME, VERSION e SKILL_DIR abaixo
#   2. ./make-release.template.sh

set -euo pipefail

# ══════════════════════════════════════════════════════════
# CONFIGURE AQUI
# ══════════════════════════════════════════════════════════
SKILL_NAME="nome-da-skill"
VERSION="X.Y.Z"
SKILL_DIR="/caminho/para/skills/${SKILL_NAME}"      # diretório da skill (SKILL.md + scripts/ + references/)
DIST_DIR="/tmp/skill-dist"                           # diretório temporário de build
RELEASES_DIR="$(dirname "$SKILL_DIR")/releases"      # onde os artefatos finais vão
RELEASE_DIR="${RELEASES_DIR}/${SKILL_NAME}-${VERSION}"
ZIP_PATH="${RELEASES_DIR}/${SKILL_NAME}-${VERSION}.zip"
# ══════════════════════════════════════════════════════════

# ── helpers ──
info()  { printf "  ● %s\n" "$*"; }
ok()    { printf "  ✓ %s\n" "$*"; }
die()   { printf "  ✗ %s\n" "$*"; exit 1; }

# ── validação inicial ──
[ -d "$SKILL_DIR" ]        || die "SKILL_DIR não encontrada: $SKILL_DIR"
[ -f "${SKILL_DIR}/SKILL.md" ] || die "SKILL.md não encontrada em $SKILL_DIR"

# ── 1. Empacotar .skill (tar.gz) para OpenClaw ──
info "Empacotando .skill..."
mkdir -p "$DIST_DIR"
tar -czf "${DIST_DIR}/${SKILL_NAME}.skill" -C "$SKILL_DIR" .
ok ".skill criado: ${DIST_DIR}/${SKILL_NAME}.skill"

# ── 2. Montar release folder ──
info "Montando release folder..."
rm -rf "$RELEASE_DIR"
mkdir -p "$RELEASE_DIR/scripts" "$RELEASE_DIR/references"

cp "${DIST_DIR}/${SKILL_NAME}.skill"       "${RELEASE_DIR}/${SKILL_NAME}.skill"
cp "${SKILL_DIR}/SKILL.md"                   "${RELEASE_DIR}/SKILL.md"
[ -d "${SKILL_DIR}/scripts" ]    && cp -R "${SKILL_DIR}/scripts/."    "${RELEASE_DIR}/scripts/"
[ -d "${SKILL_DIR}/references" ] && cp -R "${SKILL_DIR}/references/." "${RELEASE_DIR}/references/"

# Copiar README e release.json (crie na raiz da skill ou use os templates)
for f in README.md release.json .env.example; do
  [ -f "${SKILL_DIR}/${f}" ] && cp "${SKILL_DIR}/${f}" "${RELEASE_DIR}/${f}"
done

# ── 3. Gerar checksum ──
(
  cd "$RELEASE_DIR"
  sha256sum "${SKILL_NAME}.skill" > "${SKILL_NAME}.skill.sha256"
)
ok "checksum: ${RELEASE_DIR}/${SKILL_NAME}.skill.sha256"

# ── 4. Empacotar .zip final ──
rm -f "$ZIP_PATH"
(cd "$RELEASE_DIR" && zip -r "$ZIP_PATH" .) >/dev/null
ok ".zip final: $ZIP_PATH"

# ── 5. Resumo ──
echo ""
echo "═══════════════════════════════════════════════════"
echo "  Release ${SKILL_NAME} v${VERSION}"
echo "═══════════════════════════════════════════════════"
echo ""
echo "  📦 ${RELEASE_DIR}/${SKILL_NAME}.skill         (OpenClaw nativo)"
echo "  🔐 ${RELEASE_DIR}/${SKILL_NAME}.skill.sha256   (checksum)"
echo "  📦 ${ZIP_PATH}        (release completa)"
echo ""
echo "  Para instalar no Hermes:"
echo "    cp -R ${SKILL_DIR} ~/.hermes/skills/${SKILL_NAME}"
echo ""
echo "  Para publicar no OpenClaw:"
echo "    cp ${DIST_DIR}/${SKILL_NAME}.skill <destino>"
echo "═══════════════════════════════════════════════════"
echo ""
