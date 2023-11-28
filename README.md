# Born2BeRoot

## Introduction

Born2BeRoot est un projet de l'École 42 conçu pour guider les participants dans la création et la configuration d'une machine virtuelle à l'aide de VirtualBox ou UTM. Le projet met l'accent sur la mise en œuvre de règles strictes et offre une expérience pratique dans la configuration d'un système d'exploitation fonctionnel.

<br>

## Bases des Machines Virtuelles

Une machine virtuelle (VM) est une entité logicielle capable d'héberger un système d'exploitation, le faisant croire qu'il s'exécute sur du matériel réel. Les VM utilisent un hyperviseur pour gérer et isoler les ressources matérielles de la machine hôte, permettant l'exploitation simultanée de différents systèmes d'exploitation.

<br>

## LVM (Logical Volume Manager)

LVM agit comme une couche d'abstraction entre les dispositifs de stockage et les systèmes de fichiers, offrant une flexibilité accrue dans la gestion des partitions. Il permet une expansion dynamique et un déplacement des volumes logiques entre les disques physiques.

<br>

## AppArmor

AppArmor fournit une sécurité de contrôle d'accès obligatoire (MAC), permettant aux administrateurs système de restreindre les actions des processus. Les profils définissent ces restrictions, fonctionnant en mode d'application ou de plainte.

<br>

## Apt vs Aptitude

Dans les distributions OS basées sur Debian, dpkg sert de gestionnaire de paquets par défaut. APT (Advanced Package Tool) automatise la gestion des dépendances lors de l'installation de programmes. Aptitude, une interface graphique, offre un meilleur contrôle des dépendances.

<br>

## SSH (Secure Shell)

SSH est un protocole d'administration à distance assurant un contrôle sécurisé des serveurs sur Internet. Il crypte les communications et permet aux utilisateurs d'interagir avec leur serveur via le terminal de leur ordinateur.

<br>

## UFW (Uncomplicated Firewall)

UFW simplifie la gestion des iptables, améliorant considérablement la sécurité des dispositifs. Il permet l'ouverture sélective des ports, renforçant la sécurité des communications, notamment avec SSH.

<br>

## cron et wall

Cron sert de gestionnaire de tâches Linux, automatisant l'exécution de commandes à des intervalles spécifiés. Wall, de son côté, envoie des messages à tous les utilisateurs connectés, facilitant la communication à l'échelle du serveur.

<br>

## Étapes d'Installation (Debian 10 Buster)

### 1. Installation de sudo :

- Installez sudo via `apt install sudo`.
- Ajoutez un utilisateur au groupe sudo.

### 2. Installation et Configuration de SSH :

- Installez openssh-server via `apt install openssh-server`.
- Configurez les paramètres SSH dans `/etc/ssh/sshd_config`.
- Installez et configurez UFW pour la gestion du pare-feu.

### 3. Gestion des Utilisateurs :

- Configurez une politique de mot de passe robuste.
- Créez un nouvel utilisateur et un groupe.

### 4. Surveillance avec monitoring.sh :

- Développez un script bash (monitoring.sh) pour afficher les informations du serveur toutes les 10 minutes.
- Les informations incluent l'architecture du système d'exploitation, les détails du processeur, l'utilisation de la RAM, l'état LVM, les connexions actives, les utilisateurs, l'adresse IP et le nombre de commandes sudo.

<br>

## Utilisation

### 1. Clonez le Dépôt :

```bash
  git clone <lien_du_dépôt>
```

### 2. Configurez la VM :

Suivez un guide pour configurer la VM. Vous en trouverez forcément un sur le web.

### 1. Exécutez monitoring.sh :

```bash
  sh monitoring.sh
```

