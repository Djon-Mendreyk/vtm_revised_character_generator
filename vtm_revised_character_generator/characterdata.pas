unit CharacterData;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Dialogs;

type
  BackGrAndDisc = record
    Name: string;
    Rating: integer;
  end;

  Merit = record
    Name, MeritType: string;
    Rating: integer;
    CanBeActivated: boolean;
    Effect: record
      MeritDifficultyEffect, MeritDicepoolEffect: integer;
      ExtraHealth, DaredevilRemoveOne: boolean
      end;
  end;

  ExtraAbility = record
    Name, AbilityType: string;
    Rating: integer;
  end;

  TCharacterData = record
    CharacterName, PlayerName, ChronicleName, Clan, Concept, Nature, Mask: string;
    Experience, Strenght, Dexterity, Stamina, Charisma, Manipulation,
    Appearance, Perception, Intellegence, Wits, Alertness, Athletics,
    Brawl, Dodge, Empathy, Expression, Intimidation, Leadership, Streetwise,
    Subterfuge, AnimalKen, Crafts, Drive, Etiquette, Firearms, Melee,
    Perfomance, Security, Stealth, Survival, Academics, Computer, Finance,
    Investigation, Law, Linguistics, Medicine, Occult, Politics, Science,
    ConscienceConviction, SelfControlInstincts, Courage, HumanityPath,
    WillpowerMax, Willpower, Bloodpool, Damage,
    AggravatedDamage: integer;
    ExtraAbilitys: array of ExtraAbility;
    Merits: array of Merit;
    Disciplines, Backgrounds: array of BackGrAndDisc;
  end;

implementation

end.
