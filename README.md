# Art-2-Rue

Application Symfony pour archiver le street art : œuvres, artistes, lieux, techniques et photos.

## Règles d'accès
- Visiteur : consultation seulement.
- Bénévole connecté : création, modification, suppression.
- Une œuvre ne se supprime pas, elle passe en « Détruite ».
- Un artiste, une technique ou un lieu lié à une œuvre ne peut pas être supprimé.

## Installation
```bash
git clone https://github.com/Jxhanne/Symfony_ArtDeRue.git
cd Symfony_ArtDeRue
composer install
```

Crée un `.env.local` :
```
DATABASE_URL="mysql://artderue:epsi@127.0.0.1:3306/artderue?serverVersion=11.8.6-MariaDB&charset=utf8mb4"
```

Crée l'utilisateur et la base dans MySQL :
```sql
CREATE DATABASE artderue;
CREATE USER 'artderue'@'localhost' IDENTIFIED BY 'epsi';
GRANT ALL ON artderue.* TO 'artderue'@'localhost';
```

Importe les données :
```bash
mysql -u artderue -pepsi artderue < artderue.sql
symfony server:start
```

## Compte de test
- Email : test@test.fr
- Mot de passe : epsi1234!

## Photos
Les images sont dans `public/Photos` et sont versionnées dans le dépôt.
Les nouvelles photos envoyées via l'appli y sont enregistrées.