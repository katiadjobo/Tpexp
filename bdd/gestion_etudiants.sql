drop database if exists gestion_etudiants;

	create database if not exists gestion_etudiants;

		use gestion_etudiants;



			create table Classes(libelleClasse varchar(50) primary key,Niveau varchar(50),Filiere varchar(50));

			create table Module(libelleModule varchar(50) primary key);

			create table Etudiant(matriculeEtudiant int(10) auto_increment primary key,Nom varchar(50),Prenom varchar(50),
			D_Naisssance date,Sexe varchar(1),libelleClasse varchar(50),Competances varchar(255),parcour varchar(100),Avatar varchar(100));


	create table Professeur(matriculeProfesseur int(10) auto_increment primary key,Nom varchar(50),Prenom varchar(50),
		D_Naisssance DATE,Sexe varchar(1),Grade varchar(50),libelleClasse varchar(50),libelleModule varchar(50),Avatar varchar(100));


		create table Cours(dateCours date primary key,libelleClasse varchar(50),matriculeProfesseur int(4),
		libelleModule varchar(50),Semestre varchar(10),heureModule varchar(50),heureDebut varchar(50),heureFin varchar(50));

	create table Absence(dateAbsence date primary key,matriculeEtudiant int(4),dateCours date);


	create table Utilisateurs(Nom varchar(50) primary key, Login varchar(50),Role varchar(50),
		password_hash(Pwd) varchar(255),Avatar varchar(100));

	Alter table Etudiant add constraint foreign key (libelleClasse) references Classe(libelleClasse);
	Alter table Professeur add constraint foreign key (libelleClasse) references Classe(libelleClasse);
	Alter table Professeur add constraint foreign key (libelleModule) references Module(libelleModule);
		Alter table Cours add constraint foreign key (libelleClasse) references Classe(libelleClasse);
		Alter table Cours add constraint foreign key (matriculeProfesseur) references Professeur(matriculeProfesseur);
		Alter table Cours add constraint foreign key (libelleModule) references Module(libelleModule);
			Alter table Absence add constraint foreign key (matriculeEtudiant) references Etudiant(matriculeEtudiant);
			Alter table Absence add constraint foreign key (dateCours) references Cours(dateCours);

				
	INSERT INTO `Classe`(`Niveau`, `Filiere`) VALUES ('L1','IAGE'),('L2','IAGE'),('L3','IAGE');

	INSERT INTO `Utilisateurs`(`Nom`, `Login`, `Role`, password_hash `Pwd`,'Avatar') VALUES ('admin','admin','admin',password_hash('123'),'C:\Users\Hp\Pictures\MEmu Photo');

	<?php 
// Vérification de la validité des informations

// Hachage du mot de passe
$pass_hache = password_hash($_POST['pass'], PASSWORD_DEFAULT);

// Insertion
$req = $bdd->prepare('INSERT INTO membres(pseudo, pass, email, date_inscription) VALUES(:pseudo, :pass, :email, CURDATE())');
$req->execute(array(
    'pseudo' => $pseudo,
    'pass' => $pass_hache,
    'email' => $email));


INSERT INTO `etudiant` (`matriculeEtudiant`, `nomEtudiant`, `prenomEtudiant`, `d_Naisssance`, `sexeEtudiant`, `libelleClasse`, `competances`, `parcour`, `avatarEtudiant`)
 VALUES (NULL, 'DOUD', 'Fred', '1994-11-12', 'M', 'MAE1', 'Aucun', 'Ecole primaire 1996-2000\r\nCollege 2000-2004\r\nlycée 2004-2007\r\nUniversité 2007-2021', 'C:\\wamp64\\www\\gestion_des_etudiants\\images\\r.jpg'),
(NULL, 'CLAR', 'Camille', '1994-05-12', 'F', 'GLRS2', 'programmation php', 'Ecole primaire 1996-2000\r\nCollege 2000-2004\r\nlycée 2004-2007\r\nUniversité 2007-2021', 'C:\\wamp64\\www\\gestion_des_etudiants\\images\\h.jpg'),
(NULL, 'JOAD', 'Nail', '1995-10-12', 'M', 'GLRS2', 'Neant', 'Ecole primaire 1996-2000\r\nCollege 2000-2004\r\nlycée 2004-2007\r\nUniversité 2007-2021', 'C:\\wamp64\\www\\gestion_des_etudiants\\images\\k.jpg'),
 (NULL, 'GLET', 'Julie', '1997-12-10', 'F', 'IAGE1', 'programmation java', 'Ecole primaire 1996-2000\r\nCollege 2000-2004\r\nlycée 2004-2007\r\nUniversité 2007-2021', 'C:\\wamp64\\www\\gestion_des_etudiants\\images\\f.jpg');