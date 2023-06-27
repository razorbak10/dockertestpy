-- Cr�ation de la table Player
CREATE TABLE Player (
  player_id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
  username VARCHAR(255),
  password_hash VARCHAR(255),
  salt VARCHAR(255),
  max_lvl INT,
  level INT,
  experience FLOAT,
  money FLOAT,
  max_health INT,
  AP FLOAT,
  AD FLOAT,
  armor FLOAT,
  magic_resist FLOAT,
  crit FLOAT,
  esquive FLOAT,
  speed FLOAT
);

-- Cr�ation de la table Item
CREATE TABLE Item (
  item_id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
  name VARCHAR(255),
  type INT,
  AP FLOAT,
  AD FLOAT,
  armor FLOAT,
  magic_resist FLOAT,
  crit FLOAT,
  esquive FLOAT,
  speed FLOAT
);

-- Cr�ation de la table PlayerPossessItems
CREATE TABLE PlayerPossessItems (
  player_id INT,
  item_id INT,
  actual_exp INT,
  actual_level INT,
  is_equipped BIT,
  FOREIGN KEY (player_id) REFERENCES Player(player_id),
  FOREIGN KEY (item_id) REFERENCES Item(item_id),
  PRIMARY KEY (player_id, item_id)
);

CREATE TABLE SkillCategory (
	skill_cat_id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	name VARCHAR(255),
);

-- Cr�ation de la table Skill
CREATE TABLE Skill (
  skill_id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
  skill_cat_id INT,
  name VARCHAR(255),
  max_lvl INT,
  max_exp INT,
  cooldown INT,
  description VARCHAR(255),
  FOREIGN KEY (skill_cat_id) REFERENCES SkillCategory(skill_cat_id)
);



-- Cr�ation de la table PlayerPossessSkills
CREATE TABLE PlayerPossessSkills (
  player_id INT,
  skill_id INT,
  actual_exp INT,
  actual_lvl INT,
  equipped BIT,
  FOREIGN KEY (player_id) REFERENCES Player(player_id),
  FOREIGN KEY (skill_id) REFERENCES Skill(skill_id),
  PRIMARY KEY (player_id, skill_id)
);


-- Cr�ation de la table Rarity
CREATE TABLE Rarity (
  rarity_id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
  name VARCHAR(255),
  color VARCHAR(255),
  max_lvl INT,
  tiers INT
);


-- Cr�ation de la table ItemHasRarity
CREATE TABLE ItemHasRarity (
  item_id INT,
  rarity_id INT,
  name VARCHAR(255),
  FOREIGN KEY (item_id) REFERENCES Item(item_id),
  FOREIGN KEY (rarity_id) REFERENCES Rarity(rarity_id),
  PRIMARY KEY (item_id, rarity_id)
);



-- Cr�ation de la table Invocation
CREATE TABLE Invocation (
  invocation_id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
  name VARCHAR(255),
  cost INT
);

-- Cr�ation de la table InocationContainsItems
CREATE TABLE InvocationContainsItems (
  invocation_id INT,
  item_id INT,
  name VARCHAR(255),
  FOREIGN KEY (invocation_id) REFERENCES Invocation(invocation_id),
  FOREIGN KEY (item_id) REFERENCES Item(item_id),
  PRIMARY KEY (invocation_id,item_id)
);

-- Cr�ation de la table Loot
CREATE TABLE Loot (
  pool_id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
  name VARCHAR(255)
);

-- Cr�ation de la table LootHasItems
CREATE TABLE LootHasItems (
  loot_id INT,
  item_id INT,
  name VARCHAR(255),
  FOREIGN KEY (loot_id) REFERENCES Loot(pool_id),
  FOREIGN KEY (item_id) REFERENCES Item(item_id),
  PRIMARY KEY (loot_id,item_id)
);

-- Cr�ation de la table Combat
CREATE TABLE Combat (
  combat_id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
  name VARCHAR(255)
);

-- Cr�ation de la table CombatHasLoot
CREATE TABLE CombatHasLoot (
  combat_id INT,
  loot_id INT,
  name VARCHAR(255),
  FOREIGN KEY (combat_id) REFERENCES Combat(combat_id),
  FOREIGN KEY (loot_id) REFERENCES Loot(pool_id),
  PRIMARY KEY (combat_id,loot_id)
);

-- Cr�ation de la table Round
CREATE TABLE Rounds (
  round_id INT NOT NULL IDENTITY(1,1) PRIMARY KEY
);

-- Cr�ation de la table CombatHasRounds
CREATE TABLE CombatHasRounds (
  combat_id INT,
  round_id INT,
  name VARCHAR(255),
  FOREIGN KEY (combat_id) REFERENCES Combat(combat_id),
  FOREIGN KEY (round_id) REFERENCES Rounds(round_id),
  PRIMARY KEY (combat_id,round_id)
);

-- Cr�ation de la table Entity
CREATE TABLE Entity (
  id_entity INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
  name VARCHAR(255),
  level INT,
  max_health INT,
  AP FLOAT,
  AD FLOAT,
  armor FLOAT,
  magic_resist FLOAT,
  speed FLOAT,
  crit FLOAT,
  esquive FLOAT,
  enemy BIT
);

-- Cr�ation de la table RoundHasEntities
CREATE TABLE RoundHasEntities (
  id_entity INT,
  round_id INT,
  actual_health INT,
  FOREIGN KEY (id_entity) REFERENCES Entity(id_entity),
  FOREIGN KEY (round_id) REFERENCES Rounds(round_id),
  PRIMARY KEY (id_entity,round_id)
);

