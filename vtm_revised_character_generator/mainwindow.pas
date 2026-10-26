unit MainWindow;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, Menus,
  StdCtrls, Buttons, ComCtrls, Grids, ActnList, Spin, Interfaces, NatureWindow, DisciplinesWindow,
  AddDataWindow, MeritsWindow, BackGroupsWindow, PsyhosesWindow, Descriptions, ExtraAbilityFrame,
  CharacterData, PointValue, LazUTF8, LazNumEdit, fpjson, jsonparser, jsonscanner, Math;

type

  { TMain }

  TMain = class(TForm)
    Button1: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    Button9: TButton;
    Button17: TButton;
    Button18: TButton;
    Button6: TButton;
    Button2: TButton;
    Button16: TButton;
    Button14: TButton;
    Button4: TButton;
    Button5: TButton;
    Button3: TButton;
    Button7: TButton;
    Button8: TButton;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckGroup1: TPointValue;
    CheckGroup10: TPointValue;
    CheckGroup11: TPointValue;
    CheckGroup12: TPointValue;
    CheckGroup13: TPointValue;
    CheckGroup14: TPointValue;
    CheckGroup15: TPointValue;
    CheckGroup16: TPointValue;
    CheckGroup17: TPointValue;
    CheckGroup18: TPointValue;
    CheckGroup19: TPointValue;
    CheckGroup2: TPointValue;
    CheckGroup20: TPointValue;
    CheckGroup21: TPointValue;
    CheckGroup22: TPointValue;
    CheckGroup23: TPointValue;
    CheckGroup24: TPointValue;
    CheckGroup25: TPointValue;
    CheckGroup26: TPointValue;
    CheckGroup27: TPointValue;
    CheckGroup28: TPointValue;
    CheckGroup29: TPointValue;
    CheckGroup3: TPointValue;
    CheckGroup30: TPointValue;
    CheckGroup31: TPointValue;
    CheckGroup32: TPointValue;
    CheckGroup33: TPointValue;
    CheckGroup34: TPointValue;
    CheckGroup35: TPointValue;
    CheckGroup36: TPointValue;
    CheckGroup37: TPointValue;
    CheckGroup38: TPointValue;
    CheckGroup39: TPointValue;
    CheckGroup4: TPointValue;
    CheckGroup40: TPointValue;
    CheckGroup41: TPointValue;
    CheckGroup42: TPointValue;
    CheckGroup43: TPointValue;
    CheckGroup44: TPointValue;
    CheckGroup45: TPointValue;
    CheckGroup46: TPointValue;
    CheckGroup47: TPointValue;
    CheckGroup48: TPointValue;
    CheckGroup5: TPointValue;
    CheckGroup6: TPointValue;
    CheckGroup7: TPointValue;
    CheckGroup8: TPointValue;
    CheckGroup9: TPointValue;
    ComboBox1: TComboBox;
    Edit6: TEdit;
    Edit2: TEdit;
    Edit5: TEdit;
    Edit3: TEdit;
    Edit1: TEdit;
    Edit4: TEdit;
    Image1: TImage;
    Image2: TImage;
    Label1: TLabel;
    Label64: TLabel;
    Labelextra: TLabel;
    LabelName: TLabel;
    LabelClan: TLabel;
    Label20: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    LabelPlayer: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label2: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    LabelTalant: TLabel;
    LabelSkill: TLabel;
    LabelKnow: TLabel;
    Labelplus: TLabel;
    Label3: TLabel;
    LabelDob: TLabel;
    LabelDis: TLabel;
    LabelBio: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    LabelAuthor: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Labelblood: TLabel;
    Label4: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label5: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label6: TLabel;
    Label39: TLabel;
    Label61: TLabel;
    Label45: TLabel;
    Label63: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    LazIntegerEdit1: TLazIntegerEdit;
    Memo1: TMemo;
    Memo3: TMemo;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    OpenDialog1: TOpenDialog;
    PageControl1: TPageControl;
    PopupMenu1: TPopupMenu;
    SaveDialog1: TSaveDialog;
    SaveDialog2: TSaveDialog;
    ScrollBox1: TScrollBox;
    ScrollBox2: TScrollBox;
    ScrollBox3: TScrollBox;
    SpinEdit0: TSpinEdit;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    StringGrid2: TStringGrid;
    StringGrid3: TStringGrid;
    StringGrid1: TStringGrid;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button13MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: integer);
    procedure Button9Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure CheckBox2Change(Sender: TObject);
    procedure CheckGroup1ItemClick(Sender: TObject; Index: integer);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure ButtonDeleteClick(Sender: TObject);
    procedure StringGrid1ColRowInserted(Sender: TObject; IsColumn: boolean;
      sIndex, tIndex: integer);
    procedure StringGrid1ColRowMoved(Sender: TObject; IsColumn: boolean;
      sIndex, tIndex: integer);
    procedure StringGrid1DblClick(Sender: TObject);
    procedure StringGrid2SelectCell(Sender: TObject; aCol, aRow: integer;
      var CanSelect: boolean);
    procedure Memo2Text(Item: string);
    procedure GridUpdate(namegrid: integer = 0);
    procedure NewExtraAbility(AbilityType: string; AddToData: boolean = True);
    procedure NameEdit(Sender: TObject);
    procedure ValueEdit(Sender: TObject; Index: integer);
    procedure Grid1Fill;
    procedure Grid2Fill;
    procedure Grid3Fill;
    procedure PointPaint(col, row, Value: integer; mode: boolean = False);
    procedure SetValue(NameVar: string; Value: variant);
    function GetValue(NameVar: string): variant;
  private
  public

  end;

const
  POS = 'Достоинство';
  FieldsName: array of string =
    ('Strenght', 'Dexterity', 'Stamina', 'Charisma', 'Manipulation',
    'Appearance', 'Perception', 'Intellegence', 'Wits', 'Alertness',
    'Athletics', 'Brawl', 'Dodge', 'Empathy', 'Expression', 'Intimidation',
    'Leadership', 'Streetwise', 'Subterfuge', 'AnimalKen', 'Crafts',
    'Drive', 'Etiquette', 'Firearms', 'Melee', 'Perfomance', 'Security',
    'Stealth', 'Survival', 'Academics', 'Computer', 'Finance',
    'Investigation', 'Law', 'Linguistics', 'Medicine', 'Occult',
    'Politics', 'Science', 'ConscienceConviction', 'SelfControlInstincts',
    'Courage', 'HumanityPath', 'WillpowerMax', 'Willpower', 'Bloodpool',
    'Damage', 'AggravatedDamage');
  TextFieldsName: array of string =
    ('CharacterName', 'Nature', 'Mask', 'PlayerName', 'Concept',
    'ChronicleName', 'Clan');

var
  Main: TMain;
  filename, line: string;
  i, j, k: integer;
  opened: boolean;
  rowsread: boolean = False;
  gl: array[1..3] of integer;
  json, jsonobj: TJsonObject;
  jsonArray: TJSONArray;
  ExtraAbilitys: TList;
  frame: TFrame0;
  Fields: TList;
  GridList: array[1..3] of TStringGrid;
  EditList: array[1..7] of TComponent;
  Character: TCharacterData;

implementation

{$R *.lfm}

{ TMain }

procedure TMain.Memo2Text(Item: string);
begin
  GetMemoText(Memo1, Item);
end;

procedure TMain.SetValue(NameVar: string; Value: variant);
begin
  case NameVar of
    'Strenght': Character.Strenght := Value;
    'Dexterity': Character.Dexterity := Value;
    'Stamina': Character.Stamina := Value;
    'Charisma': Character.Stamina := Value;
    'Manipulation': Character.Manipulation := Value;
    'Appearance': Character.Appearance := Value;
    'Perception': Character.Perception := Value;
    'Intellegence': Character.Intellegence := Value;
    'Wits': Character.Wits := Value;
    'Alertness': Character.Alertness := Value;
    'Athletics': Character.Athletics := Value;
    'Brawl': Character.Brawl := Value;
    'Dodge': Character.Dodge := Value;
    'Empathy': Character.Empathy := Value;
    'Expression': Character.Expression := Value;
    'Intimidation': Character.Intimidation := Value;
    'Leadership': Character.Leadership := Value;
    'Streetwise': Character.Streetwise := Value;
    'Subterfuge': Character.Subterfuge := Value;
    'AnimalKen': Character.AnimalKen := Value;
    'Crafts': Character.Crafts := Value;
    'Drive': Character.Drive := Value;
    'Etiquette': Character.Etiquette := Value;
    'Firearms': Character.Firearms := Value;
    'Melee': Character.Melee := Value;
    'Perfomance': Character.Perfomance := Value;
    'Security': Character.Security := Value;
    'Stealth': Character.Stealth := Value;
    'Survival': Character.Survival := Value;
    'Academics': Character.Academics := Value;
    'Computer': Character.Computer := Value;
    'Finance': Character.Finance := Value;
    'Investigation': Character.Investigation := Value;
    'Law': Character.Law := Value;
    'Linguistics': Character.Linguistics := Value;
    'Medicine': Character.Medicine := Value;
    'Occult': Character.Occult := Value;
    'Politics': Character.Politics := Value;
    'Science': Character.Science := Value;
    'ConscienceConviction': Character.ConscienceConviction := Value;
    'SelfControlInstincts': Character.SelfControlInstincts := Value;
    'Courage': Character.Courage := Value;
    'HumanityPath': Character.HumanityPath := Value;
    'WillpowerMax': Character.WillpowerMax := Value;
    'Willpower': Character.Willpower := Value;
    'Bloodpool': Character.Bloodpool := Value;
    'Damage': Character.Damage := Value;
    'AggravatedDamage': Character.AggravatedDamage := Value;
    'CharacterName': Character.CharacterName := Value;
    'Nature': Character.Nature := Value;
    'Mask': Character.Mask := Value;
    'PlayerName': Character.PlayerName := Value;
    'Concept': Character.Concept := Value;
    'ChronicleName': Character.ChronicleName := Value;
    'Clan': Character.Clan := Value;
    else
      ShowMessage(Format('Параметр %s отсутствует в записи.',
        [NameVar]));
  end;
end;

function TMain.GetValue(NameVar: string): variant;
begin
  case NameVar of
    'Strenght': Result := Character.Strenght;
    'Dexterity': Result := Character.Dexterity;
    'Stamina': Result := Character.Stamina;
    'Charisma': Result := Character.Stamina;
    'Manipulation': Result := Character.Manipulation;
    'Appearance': Result := Character.Appearance;
    'Perception': Result := Character.Perception;
    'Intellegence': Result := Character.Intellegence;
    'Wits': Result := Character.Wits;
    'Alertness': Result := Character.Alertness;
    'Athletics': Result := Character.Athletics;
    'Brawl': Result := Character.Brawl;
    'Dodge': Result := Character.Dodge;
    'Empathy': Result := Character.Empathy;
    'Expression': Result := Character.Expression;
    'Intimidation': Result := Character.Intimidation;
    'Leadership': Result := Character.Leadership;
    'Streetwise': Result := Character.Streetwise;
    'Subterfuge': Result := Character.Subterfuge;
    'AnimalKen': Result := Character.AnimalKen;
    'Crafts': Result := Character.Crafts;
    'Drive': Result := Character.Drive;
    'Etiquette': Result := Character.Etiquette;
    'Firearms': Result := Character.Firearms;
    'Melee': Result := Character.Melee;
    'Perfomance': Result := Character.Perfomance;
    'Security': Result := Character.Security;
    'Stealth': Result := Character.Stealth;
    'Survival': Result := Character.Survival;
    'Academics': Result := Character.Academics;
    'Computer': Result := Character.Computer;
    'Finance': Result := Character.Finance;
    'Investigation': Result := Character.Investigation;
    'Law': Result := Character.Law;
    'Linguistics': Result := Character.Linguistics;
    'Medicine': Result := Character.Medicine;
    'Occult': Result := Character.Occult;
    'Politics': Result := Character.Politics;
    'Science': Result := Character.Science;
    'ConscienceConviction': Result := Character.ConscienceConviction;
    'SelfControlInstincts': Result := Character.SelfControlInstincts;
    'Courage': Result := Character.Courage;
    'HumanityPath': Result := Character.HumanityPath;
    'WillpowerMax': Result := Character.WillpowerMax;
    'Willpower': Result := Character.Willpower;
    'Bloodpool': Result := Character.Bloodpool;
    'Damage': Result := Character.Damage;
    'AggravatedDamage': Result := Character.AggravatedDamage;
    'CharacterName': Result := Character.CharacterName;
    'Nature': Result := Character.Nature;
    'Mask': Result := Character.Mask;
    'PlayerName': Result := Character.PlayerName;
    'Concept': Result := Character.Concept;
    'ChronicleName': Result := Character.ChronicleName;
    'Clan': Result := Character.Clan;
    else
      ShowMessage(Format('Параметр %s отсутствует в записи.',
        [NameVar]))
  end;
end;

procedure TMain.StringGrid2SelectCell(Sender: TObject;//Выделение строки
  aCol, aRow: integer; var CanSelect: boolean);
begin
  gl[(Sender as TStringGrid).tag] := aRow;
  Memo2Text((Sender as TStringGrid).Cells[1, aRow]);
end;

procedure TMain.Button1Click(Sender: TObject);//Натура и маска
begin
  line := Nat;
  if line <> '' then if (Sender as TButton).tag = 1 then Edit2.Text := line
    else
      Edit3.Text := line;
end;

procedure TMain.Button10Click(Sender: TObject);//Экспорт листа
const
  varDOSNEDlist: array of
    string = ('Проклятие', 'Плохое зрение',
    'Долг признательности', 'Враг', 'Стигматы',
    'Лицо в шрамах', 'Одержимость внешним видом',
    'Жертва инцеста', 'Зависимость от магии',
    'Чутьё на вампиров', 'Долг', 'Домен',
    'Кровавая охота', 'Должность',
    'Открытая рана', 'Дары Обязанности',
    'Долг Обязанности', 'Просвещенный',
    'Жажда смерти', 'Брошенный любовник',
    'Владения', 'Любовник',
    'Могущественный потомок',
    'Тщеславие');
var
  col, row: integer;
  morehealth, varDOSNED: boolean;
begin
  image2.Picture := image1.Picture;
  morehealth := False;
  if Edit1.Text <> '' then SaveDialog1.FileName := Edit1.Text
  else
    SaveDialog1.FileName := 'Лист VTM';
  if SaveDialog1.Execute then
  begin
    Image2.Canvas.Brush.Style := bsClear;
    Image2.Canvas.Font.Size := 12;
    Image2.Canvas.TextOut(190, 195, Edit1.Text);//Имя персонажа
    Image2.Canvas.TextOut(430, 245, ComboBox1.Text);//Клан
    Image2.Canvas.TextOut(430, 195, Edit2.Text);//Натура
    Image2.Canvas.TextOut(430, 220, Edit3.Text);//Маска
    Image2.Canvas.TextOut(190, 220, Edit4.Text);//Игрок
    Image2.Canvas.TextOut(700, 245, Edit5.Text);//Концепт
    Image2.Canvas.TextOut(620, 1210, IntToStr(LazIntegerEdit1.Value));//Опыт
    Image2.Canvas.TextOut(190, 245, Edit6.Text);//Хроника
    for i := Low(Character.Merits) to High(Character.Merits) do
    begin//Таблица дос/нед
      varDOSNED := False;
      for j := Low(varDOSNEDlist) to High(varDOSNEDlist) do
        if Character.Merits[i].Name = varDOSNEDlist[j] then
        begin
          varDOSNED := True;
          Break;
        end;
      if varDOSNED = True then line :=
          Format('%s (%d)', [Character.Merits[i].Name, Character.Merits[i].Rating])
      //Значение у дос/нед при наличии выбора
      else
        case Character.Merits[i].Name of
          'Кинфолк': line :=
              Format('%s (%s)', [Character.Merits[i].Name,
              Character.Merits[i].MeritType]);
          //Тип Кинфолка
          'Огромные размеры': begin
            Image2.Canvas.Rectangle(806, 978, 817, 990);
            line := Character.Merits[i].Name;
            Image2.Canvas.TextOut(612, 977, 'Пустяк (доп)');
            morehealth := True;
          end;//Доп пункт здоровья
          'Низкая чувствительность': begin
            Image2.Canvas.Brush.Color := clWhite;
            Image2.Canvas.FillRect(752, 1020, 785, 1135);
            Image2.Canvas.Brush.Style := bsClear;
            Image2.Canvas.TextOut(764, 1067, '-1');
            Image2.Canvas.TextOut(764, 1090, '-1');
            Image2.Canvas.TextOut(764, 1113, '-2');
            line := Character.Merits[i].Name;
          end;//Изменение штрафа урона
          '14-е поколение', '15-е поколение': begin
            line := Character.Merits[i].Name;
            col := 13 - StrToInt(line.Split('-')[0]);
          end;//14/15 поколения
          else
            line := Character.Merits[i].Name
        end;
      if Image2.Canvas.TextWidth(line) >= 260 then
      begin//Проверка на длину строки
        j := 12;
        while Image2.Canvas.TextWidth(line) > 260 do
        begin
          j := j - 1;
          Image2.Canvas.Font.Size := j;
          //Уменьшение шрифта при превышении длины строки на листе
        end;
        Image2.Canvas.TextOut(82, 983 + 25 * (i), line);
        Image2.Canvas.Font.Size := 12;
      end
      else
        Image2.Canvas.TextOut(82, 980 + 25 * (i), line);
    end;
    for i := Low(Character.Backgrounds) to High(Character.Backgrounds) do
    begin//Таблица биографии
      Image2.Canvas.TextOut(90, 758 + 25 * i, Character.Backgrounds[i].Name);
      if Character.Backgrounds[i].Name = 'Поколение' then
        col := Character.Backgrounds[i].Rating;
      if Character.Backgrounds[i].Rating > 5 then
        Image2.Canvas.TextOut(322, 758 + 25 * i,
          IntToStr(Character.Backgrounds[i].Rating));
    end;
    if (ComboBox1.Text <> '') and (ComboBox1.Text <> 'Гуль') then
      Image2.Canvas.TextOut(725, 195, (Format('%d-ое', [13 - col])));
    //Поколение
    for i := Low(Character.Disciplines) to High(Character.Disciplines) do
    begin//Таблица дисциплин
      Image2.Canvas.TextOut(347, 760 + 25 * i, Character.Disciplines[i].Name);
      if Character.Disciplines[i].Rating > 5 then
        Image2.Canvas.TextOut(347, 760 + 25 * i,
          IntToStr(Character.Disciplines[i].Rating));
    end;
    for i := 0 to 8 do if TPointValue(Fields[i]).Value > 5 then
      begin
        col := 312 + (i div 3) * 256;
        row := 350 + (i mod 3) * 22;
        Image2.Canvas.TextOut(col, row, IntToStr(TPointValue(Fields[i]).Value));
      end;
    for i := 0 to 2 do for j := 0 to 9 do
        if TPointValue(Fields[9 + i * 10 + j]).Value > 5 then
        begin
          col := 240 + i * 256;
          row := 463 + 21 * j;
          Image2.Canvas.TextOut(col, row,
            IntToStr(TPointValue(Fields[9 + i * 10 + j]).Value));
        end;
    Image2.Canvas.Brush.Color := clBlack;
    //Нужно для рисования точек
    for i := 0 to 8 do
    begin//Атрибуты
      col := 260 + (i div 3) * 256;
      row := 350 + (i mod 3) * 22;
      PointPaint(col, row, TPointValue(Fields[i]).Value);
    end;
    for i := 0 to 2 do for j := 0 to 9 do
      begin//Статы
        col := 262 + i * 256;
        row := 475 + 21 * j;
        PointPaint(col, row, TPointValue(Fields[9 + i * 10 + j]).Value, True);
      end;
    col := 773;
    for i := 0 to 2 do
    begin//Добродеятельность
      row := 769 + i * 73;
      PointPaint(col, row, TPointValue(Fields[i + 39]).Value);
    end;
    col := 260;
    for i := Low(Character.Backgrounds) to min(High(Character.Backgrounds), 5) do
    begin//Точки биографии
      row := 770 + 24 * (i);
      if Character.Backgrounds[i].Rating > 0 then
        for j := 0 to min(Character.Backgrounds[i].Rating, 5) - 1 do
          Image2.Canvas.ellipse(col + 12 * j, row, col + 13 + 12 * j, row + 13);
    end;
    col := 516;
    for i := Low(Character.Disciplines) to min(High(Character.Disciplines), 5) do
    begin//Точки дисциплин
      row := 770 + 24 * (i);
      if Character.Disciplines[i].Rating > 0 then
        for j := 0 to min(Character.Disciplines[i].Rating, 5) - 1 do
          Image2.Canvas.ellipse(col + 12 * j, row, col + 13 + 12 * j, row + 13);
    end;
    Image2.Canvas.Pen.Color := clRed;
    Image2.Canvas.Pen.Width := 3;
    for i := 0 to 9 do
    begin//Сила воли и человечность
      if CheckGroup43.Checked[i] = True then
      begin//Человечность
        Image2.Canvas.MoveTo(349 + i * 24, 1017);
        Image2.Canvas.LineTo(361 + i * 24, 1028);
      end;
      if CheckGroup44.Checked[i] = True then
      begin//Пост. сила воли
        Image2.Canvas.MoveTo(349 + i * 24, 1094);
        Image2.Canvas.LineTo(361 + i * 24, 1105);
      end
      else
        Image2.Canvas.FillRect(349 + i * 24, 1120, 361 + i * 24, 1133);
      if CheckBox1.Checked = True then
        if CheckGroup45.Checked[i] = True then
        begin//Вр. сила воли
          Image2.Canvas.MoveTo(349 + i * 24, 1120);
          Image2.Canvas.LineTo(361 + i * 24, 1133);
        end;
    end;
    if CheckBox1.Checked = True then
    begin
      for i := 0 to 19 do
      begin//Запас крови
        if CheckGroup46.Checked[i] = True then
        begin
          Image2.Canvas.MoveTo(350 + ((i mod 10) * 24), 1194 + (i div 10) * 30);
          Image2.Canvas.LineTo(360 + ((i mod 10) * 24), 1204 + (i div 10) * 30);
        end;
      end;
      if morehealth = True then k := 1
      else
        k := 2;
      for i := k to 8 do
      begin//Здоровье
        if i <= TPointValue(Fields[47]).Value then
        begin
          Image2.Canvas.MoveTo(806, 979 + (i - 1) * 22);
          Image2.Canvas.LineTo(817, 990 + (i - 1) * 22);
        end;
        if i <= TPointValue(Fields[48]).Value then
        begin
          Image2.Canvas.MoveTo(806, 990 + (i - 1) * 22);
          Image2.Canvas.LineTo(817, 979 + (i - 1) * 22);
        end;
      end;
    end;
    image2.Picture.SaveToFile(Utf8ToSys(SaveDialog1.FileName));
  end;
end;

procedure TMain.PointPaint(col, row, Value: integer; mode: boolean = False);
var
  t: integer;
begin
  if (Value = 0) and (mode = False) then
  begin
    Image2.Canvas.Brush.Color := clWhite;
    Image2.Canvas.ellipse(col, row, col + 13, row + 13);
    Image2.Canvas.Brush.Color := clBlack;
  end
  else
    for t := 0 to min(Value, 5) - 1 do
      Image2.Canvas.ellipse(col + 12 * t, row, col + 13 + 12 * t, row + 13);
end;

procedure TMain.Button11Click(Sender: TObject);//Кнопка сброса
begin
  while ExtraAbilitys.Count <> 0 do
    ButtonDeleteClick(tframe0(ExtraAbilitys.Items[0]).Button1);
  ExtraAbilitys.Clear;
  for i := 1 to 6 do
    TEdit(EditList[i]).Clear;
  ComboBox1.Text := '';
  for i := 1 to 48 do
    if (i < 10) or (i in [40..42]) then TPointValue(Fields[i - 1]).Value := 1
    else
      TPointValue(Fields[i - 1]).Value := 0;
  SetLength(Character.Merits, 0);
  SetLength(Character.Backgrounds, 0);
  SetLength(Character.Disciplines, 0);
  SetLength(Character.ExtraAbilitys, 0);
  GridUpdate;
end;

procedure TMain.Button12Click(Sender: TObject);//Кнопка загрузки
var
  JsonParser: TJSONParser;
begin
  if OpenDialog1.Execute then
    memo3.Lines.LoadFromFile(opendialog1.FileName);
  JsonParser := TJSONParser.Create(memo3.Text, DefaultOptions);
  if Memo3.Text <> '' then
  begin
    Button11Click(Button11);
    try
      json := JsonParser.Parse as TJsonObject;
      for i := 0 to 6 do SetValue(TextFieldsName[i], json.Get(TextFieldsName[i], ''));
      for i := 0 to 47 do
        SetValue(FieldsName[i], json.Get(FieldsName[i], 0));
      if json.FindPath('Backgrounds').Count <> 0 then
      begin
        SetLength(Character.Backgrounds, json.FindPath('Backgrounds').Count);
        for i := 0 to json.FindPath('Backgrounds').Count - 1 do
          with Character.Backgrounds[i] do
          begin
            Name := json.FindPath('Backgrounds').Items[i].FindPath('Name').AsString;
            Rating := json.FindPath('Backgrounds').Items[i].FindPath('Rating').AsInt64;
          end;
      end;
      if json.FindPath('Disciplines').Count <> 0 then
      begin
        SetLength(Character.Disciplines, json.FindPath('Disciplines').Count);
        for i := 0 to json.FindPath('Disciplines').Count - 1 do
          with Character.Disciplines[i] do
          begin
            Name := json.FindPath('Disciplines').Items[i].FindPath('Name').AsString;
            Rating := json.FindPath('Disciplines').Items[i].FindPath('Rating').AsInt64;
          end;
      end;
      if json.FindPath('Merits').Count <> 0 then
      begin
        SetLength(Character.Merits, json.FindPath('Merits').Count);
        for i := 0 to json.FindPath('Merits').Count - 1 do
          with Character.Merits[i] do
          begin
            Name := json.FindPath('Merits').Items[i].FindPath('Name').AsString;
            Rating := json.FindPath('Merits').Items[i].FindPath('Rating').AsInt64;
            if json.FindPath('Merits').Items[i].FindPath('MeritType') = nil then
              MeritType := 'Не указано'
            else
              MeritType := json.FindPath('Merits').Items[i].FindPath(
                'MeritType').AsString;
            CanBeActivated := json.FindPath('Merits').Items[i].FindPath(
              'CanBeActivated').AsBoolean;
            with Effect do
            begin
              MeritDifficultyEffect :=
                json.FindPath('Merits').Items[i].FindPath(
                'Effect').FindPath('MeritDifficultyEffect').AsInt64;
              MeritDicepoolEffect :=
                json.FindPath('Merits').Items[i].FindPath(
                'Effect').FindPath('MeritDicepoolEffect').AsInt64;
              DaredevilRemoveOne :=
                json.FindPath('Merits').Items[i].FindPath(
                'Effect').FindPath('DaredevilRemoveOne').AsBoolean;
              ExtraHealth := json.FindPath('Merits').Items[i].FindPath(
                'Effect').FindPath('ExtraHealth').AsBoolean;
            end;
          end;
      end;
      if json.FindPath('ExtraAbilitys') <> nil then
        if json.FindPath('ExtraAbilitys').Count <> 0 then
        begin
          SetLength(Character.ExtraAbilitys, json.FindPath('ExtraAbilitys').Count);
          for i := 0 to json.FindPath('ExtraAbilitys').Count - 1 do
            with Character.ExtraAbilitys[i] do
            begin
              Name := json.FindPath('ExtraAbilitys').Items[j].FindPath('Name').AsString;
              Rating := json.FindPath('ExtraAbilitys').Items[j].FindPath(
                'Rating').AsInt64;
              AbilityType := json.FindPath('ExtraAbilitys').Items[j].FindPath(
                'AbilityType').AsString;
            end;
        end;
    finally
      FreeAndNil(json);
      FreeAndNil(JsonParser);
    end;
    opened := True;
    filename := OpenDialog1.Filename;
    GridUpdate;
    for i := 0 to Length(Character.ExtraAbilitys) - 1 do
      NewExtraAbility(Character.ExtraAbilitys[i].AbilityType, False);
    for i := 0 to 47 do TPointValue(Fields[i]).Value := GetValue(FieldsName[i]);
    for i := 0 to 6 do TEdit(EditList[i + 1]).Text := GetValue(TextFieldsName[i]);
    LazIntegerEdit1.Value := Character.Experience;
  end;
  Memo3.Clear;
end;

procedure TMain.Button13Click(Sender: TObject);//Кнопка сохранения
var
  exportfile: textfile;
begin
  if opened = True then AssignFile(exportfile, filename)
  else if Edit1.Text <> '' then SaveDialog2.FileName := Edit1.Text
  else
    SaveDialog2.FileName := 'Файл сохранения';
  json := TJSONObject.Create;
  try
    for i := 0 to 6 do json.Add(TextFieldsName[i], GetValue(TextFieldsName[i]));
    json.Add('Experience', Character.Experience);
    for i := 0 to 47 do
      json.Add(FieldsName[i], GetValue(FieldsName[i]));
    json.Add('CommonDamage', CheckGroup47.Value - CheckGroup48.Value);
    jsonArray := TJSONArray.Create;
    if Length(Character.ExtraAbilitys) <> 0 then
      for i := 0 to Length(Character.ExtraAbilitys) - 1 do
        jsonArray.Add(TJSONObject.Create(['$type', 'ExtraAbility',
          'AbilityType', Character.ExtraAbilitys[i].AbilityType,
          'Name', Character.ExtraAbilitys[i].Name, 'Rating',
          Character.ExtraAbilitys[i].Rating]));
    json.Add('ExtraAbilitys', jsonArray);
    jsonArray := TJSONArray.Create;
    if Length(Character.Backgrounds) <> 0 then
      for i := 0 to Length(Character.Backgrounds) - 1 do
        jsonArray.Add(TJSONObject.Create(['$type', 'background',
          'Name', Character.Backgrounds[i].Name, 'Rating',
          Character.Backgrounds[i].Rating]));
    json.Add('Backgrounds', jsonArray);
    jsonArray := TJSONArray.Create;

    if Length(Character.Disciplines) <> 0 then
      for i := 0 to Length(Character.Disciplines) - 1 do
        jsonArray.Add(TJSONObject.Create(['$type', 'discipline',
          'Name', Character.Disciplines[i].Name, 'Rating',
          Character.Disciplines[i].Rating]));
    json.Add('Disciplines', jsonArray);
    jsonArray := TJSONArray.Create;

    if Length(Character.Merits) <> 0 then
      for i := 0 to Length(Character.Merits) - 1 do
      begin
        jsonobj := TJSONObject.Create;
        jsonobj.Add('MeritDifficultyEffect',
          Character.Merits[i].Effect.MeritDifficultyEffect);
        jsonobj.Add('MeritDicepoolEffect',
          Character.Merits[i].Effect.MeritDicepoolEffect);
        jsonobj.Add('ExtraHealth', Character.Merits[i].Effect.ExtraHealth);
        jsonobj.Add('DaredevilRemoveOne', Character.Merits[i].Effect.DaredevilRemoveOne);
        jsonArray.Add(TJSONObject.Create(['$type', 'merit', 'Name',
          Character.Merits[i].Name, 'Rating', Character.Merits[i].Rating,
          'CanBeActivated', Character.Merits[i].CanBeActivated,
          'MeritType', Character.Merits[i].MeritType, 'Effect', jsonobj]));
      end;
    json.Add('Merits', jsonArray);
    jsonArray := TJSONArray.Create;
    Memo3.Lines.Add(json.AsJSON);
  finally
    FreeAndNil(json)
  end;
  if opened = True then
  begin
    Rewrite(exportfile);
    for i := 0 to Memo3.Lines.Count - 1 do WriteLn(exportfile, Memo3.Lines[i]);
    closefile(exportfile);
  end
  else if SaveDialog2.Execute then
  begin
    Memo3.Lines.SaveToFile(Utf8ToSys(SaveDialog2.FileName));
    opened := True;
    filename := SaveDialog2.Filename;
  end;
  Memo3.Clear;
end;

procedure TMain.Button13MouseDown(Sender: TObject;//Пункт сохранить как
  Button: TMouseButton; Shift: TShiftState; X, Y: integer);
begin
  if Button = mbRight then PopupMenu1.PopUp;
end;

procedure TMain.Button9Click(Sender: TObject);//Изменение опыта
begin
  Character.Experience := LazIntegerEdit1.Value + SpinEdit0.Value;
  LazIntegerEdit1.Value := Character.Experience;
  SpinEdit0.Value := 0;
end;

procedure TMain.Button16Click(Sender: TObject);//Доп способность
begin
  case (Sender as TButton).tag of
    1: NewExtraAbility('Talent');
    2: NewExtraAbility('Skill');
    else
      NewExtraAbility('Knowledge');
  end;
end;

procedure TMain.NewExtraAbility(AbilityType: string; AddToData: boolean = True);
const
  talantList: array of
    string = ('Гадание', 'Попрошайничество',
    'Время Малкавианов', 'Дипломатия',
    'Ведение переговоров', 'Интриги',
    'Разыскивание', 'Обыск', 'Изящество',
    'Инструктаж', 'Допрос', 'Интуиция', 'Маскарад',
    'Мимикрия', 'Стиль', 'Метание', 'Чревовещание',
    'Талант хобби');
  skillList: array of string =
    ('Лепка тела', 'Танец огня', 'Акробатика',
    'Камуфляж', 'Охота', 'Стрельба из лука',
    'Взрывчатка', 'Маскировка', 'Гербализм',
    'Чтение по губам', 'Медитация', 'Пилот',
    'Верховая езда', 'Ловкость рук',
    'Профессиональный навык');
  KnowledgeList: array of
    string = ('Знание', 'Знание Черн.руки',
    'Знание преступ.мира', 'Знания Сеттитов',
    'Знание Камарильи', 'Знание Шабаша',
    'Клановые знания', 'Знание местности',
    'Знание канализаций', 'Комп. взлом',
    'Экономика', 'История', 'Психология',
    'Бюрократия', 'Городские тайны',
    'Криптография', 'Загадки', 'Исследования',
    'Экспертное познание');
var
  lastpos: integer;
  Hints: array of string;
begin
  frame := TFrame0.Create(self);
  frame.Name := 'Frame' + IntToStr(ExtraAbilitys.Count + 1);
  frame.Align := alTop;
  frame.SkillType := AbilityType;
  case AbilityType of
    'Talent': begin
      frame.Parent := ScrollBox1;
      Hints := talantList;
    end;
    'Skill': begin
      frame.Parent := ScrollBox2;
      Hints := SkillList;
    end;
    else
    begin
      frame.Parent := ScrollBox3;
      Hints := KnowledgeList;
    end;
  end;
  for i := 0 to High(Hints) do frame.AddHint(Hints[i]);
  lastpos := 0;
  if ExtraAbilitys.Count <> 0 then
    for i := 0 to ExtraAbilitys.Count - 1 do
      if Tframe0(ExtraAbilitys.Items[i]).Parent = frame.Parent then
        lastpos := lastpos + frame.Height;
  frame.Top := lastpos;
  frame.Button1.OnClick := @ButtonDeleteClick;
  frame.ComboBox1.OnClick := @Label1Click;
  frame.ComboBox1.OnEditingDone := @NameEdit;
  frame.CheckGroup1.OnItemClick := @ValueEdit;
  ExtraAbilitys.Add(frame);
  if AddToData = True then
  begin
    SetLength(Character.ExtraAbilitys, Length(Character.ExtraAbilitys) + 1);
    Character.ExtraAbilitys[Length(Character.ExtraAbilitys) - 1].AbilityType :=
      AbilityType;
  end;
end;

procedure TMain.NameEdit(Sender: TObject);
begin
  i := ExtraAbilitys.IndexOf((Sender as TComboBox).Owner);
  if i <> -1 then
    Character.ExtraAbilitys[i].Name := Tframe0(ExtraAbilitys.Items[i]).Skillname;
end;

procedure TMain.ValueEdit(Sender: TObject; Index: integer);
begin
  (Sender as TPointValue).SetIndex(Index);
  i := ExtraAbilitys.IndexOf((Sender as TPointValue).Owner);
  if i <> -1 then
    Character.ExtraAbilitys[i].Rating := Tframe0(ExtraAbilitys.Items[i]).Value;
end;

procedure TMain.ButtonDeleteClick(Sender: TObject);
var
  frameToRemove: TComponent;
begin
  frameToRemove := (Sender as TButton).Owner;
  i := ExtraAbilitys.IndexOf(frameToRemove);
  if i <> -1 then
    ExtraAbilitys.Delete(i);
  FreeAndNil(frameToRemove);
  for j := i to ExtraAbilitys.Count - 1 do
  begin
    Tframe0(ExtraAbilitys.Items[j]).Name := 'Frame' + IntToStr(j + 1);
    Character.ExtraAbilitys[j] := Character.ExtraAbilitys[j + 1];
  end;
  SetLength(Character.ExtraAbilitys, Length(Character.ExtraAbilitys) - 1);
end;

procedure TMain.Button5Click(Sender: TObject);//Биография/Дисциплины
var
  newrecord: BackGrAndDisc;
begin
  if (Sender as TButton).tag = 2 then
    newrecord := GetBiblio(CheckBox2.Checked)
  else
    newrecord := GetDist(CheckBox2.Checked);
  if newrecord.Name <> '' then
    if (Sender as TButton).tag = 2 then
    begin
      SetLength(Character.Backgrounds, Length(Character.Backgrounds) + 1);
      Character.Backgrounds[High(Character.Backgrounds)] := newrecord;
    end
    else
    begin
      SetLength(Character.Disciplines, Length(Character.Disciplines) + 1);
      Character.Disciplines[High(Character.Disciplines)] := newrecord;
    end;
  GridUpdate((Sender as TButton).tag);
end;

procedure TMain.Button7Click(Sender: TObject);//Удаление записи
begin
  case (Sender as TButton).tag of
    1: if gl[1] > 0 then
      begin
        for i := gl[1] - 1 to High(Character.Merits) - 2 do
          Character.Merits[i] := Character.Merits[i + 1];
        SetLength(Character.Merits, Length(Character.Merits) - 1);
      end;
    2: if gl[2] > 0 then
      begin
        for i := gl[2] - 1 to High(Character.Backgrounds) - 2 do
          Character.Backgrounds[i] := Character.Backgrounds[i + 1];
        SetLength(Character.Backgrounds, Length(Character.Backgrounds) - 1);
      end;
    3: if gl[3] > 0 then
      begin
        for i := gl[3] - 1 to Length(Character.Disciplines) - 2 do
          Character.Disciplines[i] := Character.Disciplines[i + 1];
        SetLength(Character.Disciplines, Length(Character.Disciplines) - 1);
      end;
  end;
  GridUpdate((Sender as TButton).tag);
end;

procedure TMain.Button6Click(Sender: TObject);//Доснед
var
  newrecord: Merit;
begin
  if (Sender as TButton).tag = 1 then newrecord := GetPOSNEG
  else
    newrecord := GetPsychoses;
  if newrecord.Name <> '' then
  begin
    SetLength(Character.Merits, Length(Character.Merits) + 1);
    Character.Merits[Length(Character.Merits) - 1] := newrecord;
    GridUpdate(1);
  end;
end;

procedure TMain.CheckBox2Change(Sender: TObject);//10-е атрибуты
var
  temp1: ^TStrings;
begin
  if CheckBox2.Checked = True then temp1 := @TPointValue(Fields[43]).Items
  else
    temp1 := @TPointValue(Fields[39]).Items;
  for i := 0 to 38 do
  begin
    TPointValue(Fields[i]).Items := temp1^;
    TPointValue(Fields[i]).Update;
  end;
  if ExtraAbilitys.Count <> 0 then for i := 0 to High(ExtraAbilitys.Count) do
      with Tframe0(ExtraAbilitys[i]).CheckGroup1 do
      begin
        Items := temp1^;
        Update;
      end;
end;

procedure TMain.CheckGroup1ItemClick(Sender: TObject; Index: integer);
//Редактирование атрибута/добродеятельности
begin
  (Sender as TPointValue).SetIndex(Index);
  i := Fields.IndexOf(Sender);
  SetValue(FieldsName[i], (Sender as TPointValue).Value);
end;

procedure TMain.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  FreeAndNil(ExtraAbilitys);
  FreeAndNil(Fields);
  FreeAndNil(GridList);
  FreeAndNil(EditList);
  DictionaryFree;
  DisDictionaryFree;
end;

procedure TMain.FormCreate(Sender: TObject);//Запуск окна
begin
  ExtraAbilitys := TList.Create;
  Fields := TList.Create;
  for i := 1 to 3 do
    GridList[i] := FindComponent('StringGrid' + IntToStr(i)) as TStringGrid;
  for i := 1 to 6 do
    EditList[i] := FindComponent('Edit' + IntToStr(i)) as TEdit;
  EditList[7] := ComboBox1;
  for i := 0 to 47 do
    Fields.Add(FindComponent('CheckGroup' + IntToStr(i + 1)));
  Button11Click(Button11);
  DictionaryFill;
  DisDictionaryFill;
end;

procedure TMain.Label1Click(Sender: TObject);
begin
  case Sender.ClassName of
    'TLabel': Memo2Text((Sender as TLabel).Caption);
    'TEdit': Memo2Text((Sender as TEdit).Text);
    'TComboBox': Memo2Text((Sender as TComboBox).Text);
    else
      Memo2Text('');
  end;
end;

procedure TMain.MenuItem1Click(Sender: TObject);//Пункт сохранить как
begin
  i := integer(opened);
  opened := False;
  Button13Click(Button13);
  opened := boolean(i);
end;

procedure TMain.StringGrid1ColRowInserted(Sender: TObject; IsColumn: boolean;
  //Предупреждение о превышении выводимого кол-ва ДОС/НЕД, изменение штрафа за урон
  sIndex, tIndex: integer);
begin
  if StringGrid1.RowCount > 15 then Labelextra.Visible := True
  else
    Labelextra.Visible := False;
end;

procedure TMain.StringGrid1ColRowMoved(Sender: TObject;
  IsColumn: boolean;//Изменение порядка записей
  sIndex, tIndex: integer);
var
  temp1: Merit;
  temp2: BackGrAndDisc;
begin
  j := sIndex - 1;
  k := tIndex - 1;
  if rowsread = False then
    if (Sender as TStringGrid).RowCount > 1 then
      case (Sender as TStringGrid).tag of
        1: begin
          temp1 := Character.Merits[j];
          if j > k then
            for i := 0 to j - k - 1 do
              Character.Merits[j - i] := Character.Merits[j - i - 1]
          else
            for i := j to k - 1 do
              Character.Merits[i] := Character.Merits[i + 1];
          Character.Merits[k] := temp1;
        end;
        2: begin
          temp2 := Character.Backgrounds[k];
          if j > k then
            for i := 0 to j - k - 1 do
              Character.Backgrounds[j - i] := Character.Backgrounds[j - i - 1]
          else
            for i := j to k - 1 do
              Character.Backgrounds[i] := Character.Backgrounds[i + 1];
          Character.Backgrounds[k] := temp2;
        end;
        3: begin
          temp2 := Character.Disciplines[k];
          if j > k then
            for i := 0 to j - k - 1 do
              Character.Disciplines[j - i] := Character.Disciplines[j - i - 1]
          else
            for i := j to k - 1 do
              Character.Disciplines[i] := Character.Disciplines[i + 1];
          Character.Disciplines[k] := temp2;
        end;
      end;
  for i := 1 to (Sender as TStringGrid).RowCount - 1 do
    (Sender as TStringGrid).Cells[0, i] := IntToStr(i);
end;

procedure TMain.StringGrid1DblClick(Sender: TObject);
//Альтернативное добавление строки в таблицы
var
  temp1: Merit;
  temp2: BackGrAndDisc;
begin
  case (Sender as TStringGrid).tag of
    1: begin
      if gl[1] = 0 then
      begin
        temp1.Name := '';
        temp1 := GetMerit(temp1);
      end
      else
        temp1 := GetMerit(Character.Merits[gl[1] - 1]);
      if temp1.Name <> '' then
        if gl[1] = 0 then
        begin
          SetLength(Character.Merits, Length(Character.Merits) + 1);
          Character.Merits[High(Character.Merits)] := temp1;
        end
        else
          Character.Merits[gl[1] - 1] := temp1;
    end;
    2: begin
      if gl[2] = 0 then
      begin
        temp2.Name := '';
        temp2 := GetBackGrAndDisc(temp2);
      end
      else
        temp2 := GetBackGrAndDisc(Character.Backgrounds[gl[2] - 1]);
      if temp2.Name <> '' then
        if gl[2] = 0 then
        begin
          SetLength(Character.Backgrounds, Length(Character.Backgrounds) + 1);
          Character.Backgrounds[High(Character.Backgrounds)] := temp2;
        end
        else
          Character.Backgrounds[gl[2] - 1] := temp2;
    end
    else
    begin
      if gl[3] = 0 then
      begin
        temp2.Name := '';
        temp2 := GetBackGrAndDisc(temp2);
      end
      else
        temp2 := GetBackGrAndDisc(Character.Disciplines[gl[3] - 1]);
      if temp2.Name <> '' then
        if gl[3] = 0 then
        begin
          SetLength(Character.Disciplines, Length(Character.Disciplines) + 1);
          Character.Disciplines[High(Character.Disciplines)] := temp2;
        end
        else
          Character.Disciplines[gl[3] - 1] := temp2;
    end;
  end;
  GridUpdate((Sender as TStringGrid).tag);
end;

procedure TMain.GridUpdate(namegrid: integer = 0);
begin
  rowsread := True;
  case namegrid of
    1: Grid1Fill;
    2: Grid2Fill;
    3: Grid3Fill;
    else
    begin
      Grid1Fill;
      Grid2Fill;
      Grid3Fill;
    end;
  end;
  rowsread := False;
end;

procedure TMain.Grid1Fill;
begin
  GridList[1].RowCount := 1;
  if Length(Character.Merits) <> 0 then
    for i := 0 to High(Character.Merits) do
      GridList[1].InsertRowWithValues(GridList[1].RowCount,
        [IntToStr(GridList[1].RowCount), Character.Merits[i].Name,
        Character.Merits[i].MeritType, IntToStr(Character.Merits[i].Rating)]);
end;

procedure TMain.Grid2Fill;
begin
  GridList[2].RowCount := 1;
  if Length(Character.Backgrounds) <> 0 then
    for i := 0 to High(Character.Backgrounds) do
      GridList[2].InsertRowWithValues(GridList[2].RowCount,
        [IntToStr(GridList[2].RowCount), Character.Backgrounds[i].Name,
        IntToStr(Character.Backgrounds[i].Rating)]);
end;

procedure TMain.Grid3Fill;
begin
  GridList[3].RowCount := 1;
  if Length(Character.Disciplines) <> 0 then
    for i := 0 to High(Character.Disciplines) do
      GridList[3].InsertRowWithValues(GridList[3].RowCount,
        [IntToStr(GridList[3].RowCount), Character.Disciplines[i].Name,
        IntToStr(Character.Disciplines[i].Rating)]);
end;

end.
