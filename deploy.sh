#!/usr/bin/env bash
# deploy.sh — Déploiement manuel vers Netlify via CLI
# Usage : ./deploy.sh
#
# Prérequis :
#   npm install -g netlify-cli
#   export NETLIFY_AUTH_TOKEN="votre_token"   # depuis app.netlify.com/user/applications
#   export NETLIFY_SITE_ID="votre_site_id"    # depuis Site settings > General > Site ID

set -euo pipefail

if [ -z "${NETLIFY_AUTH_TOKEN:-}" ]; then
  echo "❌ NETLIFY_AUTH_TOKEN non défini. Exportez votre token Netlify."
  exit 1
fi

if [ -z "${NETLIFY_SITE_ID:-}" ]; then
  echo "❌ NETLIFY_SITE_ID non défini. Exportez l'ID du site Netlify."
  exit 1
fi

echo "🚀 Déploiement VoyagIA en production..."
netlify deploy --dir=. --prod \
  --auth "$NETLIFY_AUTH_TOKEN" \
  --site "$NETLIFY_SITE_ID"

echo "✅ Déploiement terminé !"
