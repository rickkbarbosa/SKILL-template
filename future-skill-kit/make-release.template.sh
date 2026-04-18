#!/usr/bin/env bash
set -euo pipefail

# Uso:
#   Ajuste as variáveis abaixo e rode este script para gerar:
#   - pacote .skill
#   - release folder
#   - checksum .sha256
#   - .zip final

SKILL_NAME="nome-da-skill"
VERSION="X.Y.Z"
WORKSPACE="/home/openclaw/.openclaw/workspace"
SKILL_DIR="$WORKSPACE/skills/$SKILL_NAME"
DIST_DIR="$WORKSPACE/skills/dist"
RELEASE_DIR="$WORKSPACE/skills/releases/$SKILL_NAME-$VERSION"
ZIP_PATH="$WORKSPACE/skills/releases/$SKILL_NAME-$VERSION.zip"

python3 /app/skills/skill-creator/scripts/package_skill.py "$SKILL_DIR" "$DIST_DIR"

rm -rf "$RELEASE_DIR"
mkdir -p "$RELEASE_DIR/scripts" "$RELEASE_DIR/references"

cp "$DIST_DIR/$SKILL_NAME.skill" "$RELEASE_DIR/$SKILL_NAME.skill"
cp "$SKILL_DIR/SKILL.md" "$RELEASE_DIR/SKILL.md"
cp -R "$SKILL_DIR/scripts/." "$RELEASE_DIR/scripts/" 2>/dev/null || true
cp -R "$SKILL_DIR/references/." "$RELEASE_DIR/references/" 2>/dev/null || true
cp "$WORKSPACE/skills/templates/future-skill-kit/README.template.md" "$RELEASE_DIR/README.md"
cp "$WORKSPACE/skills/templates/future-skill-kit/release.template.json" "$RELEASE_DIR/release.json"

(
  cd "$RELEASE_DIR"
  sha256sum "$SKILL_NAME.skill" > "$SKILL_NAME.skill.sha256"
)

python3 - <<PY
import pathlib, zipfile
root = pathlib.Path(r"$WORKSPACE/skills/releases")
src = root / f"$SKILL_NAME-$VERSION"
out = root / f"$SKILL_NAME-$VERSION.zip"
with zipfile.ZipFile(out, 'w', zipfile.ZIP_DEFLATED) as z:
    for p in src.rglob('*'):
        if p.is_file():
            z.write(p, p.relative_to(root))
print(out)
PY

echo "Release pronta em: $RELEASE_DIR"
echo "Zip final em: $ZIP_PATH"
