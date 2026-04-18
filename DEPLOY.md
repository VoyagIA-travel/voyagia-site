# Déploiement VoyagIA sur Netlify

## Étapes rapides

### Option A — Glisser-déposer (le plus simple)
1. Aller sur [app.netlify.com](https://app.netlify.com) et se connecter (compte gratuit)
2. Faire glisser le dossier `voyagia-site/` dans la zone de dépôt de Netlify
3. Le site est en ligne en 30 secondes — Netlify fournit une URL `*.netlify.app`

### Option B — Via GitHub + déploiement automatique (recommandé ✅)

Le dossier `voyagia-site/` est déjà un repo git avec un commit initial.
Il reste **3 étapes manuelles** car elles nécessitent vos identifiants GitHub/Netlify :

#### Étape 1 — Créer le repo GitHub
1. Aller sur [github.com/new](https://github.com/new)
2. Nom du repo : `voyagia-site` (privé ou public)
3. **Ne pas cocher** "Initialize this repository" — cliquer **Create repository**

#### Étape 2 — Pousser le code (coller ces 2 commandes dans un terminal)
```bash
# Depuis le dossier voyagia-site/
git remote add origin https://github.com/VOTRE_USERNAME/voyagia-site.git
git push -u origin master
```
> Remplacez `VOTRE_USERNAME` par votre nom d'utilisateur GitHub.

#### Étape 3 — Connecter Netlify
1. Sur [app.netlify.com](https://app.netlify.com) → **Add new site → Import an existing project**
2. Choisir **GitHub**, autoriser Netlify à accéder au repo
3. Sélectionner `voyagia-site` → laisser les paramètres par défaut (publish dir = `.`)
4. Cliquer **Deploy site**

**C'est tout !** À partir de là, chaque `git push` déploie le site automatiquement en ~30 secondes.

---

## Configurer la réception des formulaires par email

Le formulaire utilise **Netlify Forms** (gratuit, 100 soumissions/mois).

Après déploiement :
1. Aller dans **Site settings → Forms** dans le tableau de bord Netlify
2. Cliquer sur le formulaire `voyagia-questionnaire`
3. Aller dans **Form notifications → Add notification → Email notification**
4. Entrer l'adresse : `voyagia@hotmail.com`
5. Sauvegarder — chaque soumission enverra un email à cette adresse

---

## Structure des fichiers
```
voyagia-site/
├── index.html      # Page principale (hero + services + exemple + questionnaire)
├── merci.html      # Page de confirmation après envoi du formulaire
├── netlify.toml    # Configuration Netlify
└── DEPLOY.md       # Ce guide
```

## Changelog

### 2026-04-18 — Correction bug formulaire 404 (VOYA-16)
- **netlify.toml** : suppression du redirect catch-all `/* → /index.html` avec `status = 404` qui interceptait la redirection vers `merci.html` après soumission du formulaire
- Le formulaire redirige maintenant correctement vers `/merci.html` sur Netlify

### 2026-04-18 — Amélioration questionnaire (VOYA-15)
- **Âges des voyageurs** : dropdowns dynamiques par adulte (18–99 ans) et par enfant (0–17 ans), générés en JS au changement du compteur
- **Dates** : nouveau sélecteur "Date précise / Flexible" — calendriers départ+retour si précise, cases à cocher par mois si flexible
- **Budget** : champ texte libre + boutons "Aucune idée" et "Budget illimité"
- **Hébergement** : ajout de l'option "Insolite"
- **Nouveau champ** : "Décris ton voyage idéal" (textarea)
- **Suppression** : champ "Délai de livraison"

---

## Domaine personnalisé (facultatif)
Dans **Site settings → Domain management**, vous pouvez ajouter votre propre domaine
(ex : `voyagia.fr`) — Netlify fournit un certificat SSL gratuit.
