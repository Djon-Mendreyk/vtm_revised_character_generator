unit MeritsWindow;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Dialogs, StdCtrls,
  ComCtrls, Descriptions, CharacterData, Generics.Collections;

type
  TMeritBlock = record
    Rating: array of integer;
    MeritType: string;
    CanBeActivated: boolean;
    Effect: record
      MeritDifficultyEffect, MeritDicepoolEffect: integer;
      end;
  end;

type
  TMeritData = specialize TDictionary<string, TMeritBlock>;

type

  { TVTMDosNed }

  TVTMDosNed = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Memo1: TMemo;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
    RadioButton6: TRadioButton;
    RadioButton7: TRadioButton;
    TreeView1: TTreeView;
    procedure Button1Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure TreeView1Change(Sender: TObject; Node: TTreeNode);
  private
    function State: Merit;
  public
    property PlayerState: Merit read State;
  end;

function GetPOSNEG: Merit;
procedure MerBlock(Name: string; InpRating: array of integer;
  InpMeritType: string; InpCanBeActivated: boolean = False;
  InpDifficulty: integer = 0; InpDicepool: integer = 0);
procedure DisDictionaryFill;
procedure DisDictionaryFree;

const
  NEG = 'Даёт очков';
  POS = 'Требует очков';


var
  VTMDosNed: TVTMDosNed;
  power, Checked, i: integer;
  line: string;
  RadioPoints: array[1..7] of TRadioButton;
  MeritData: TMeritData;
  SelectedMerit: TMeritBlock;

implementation

function GetPOSNEG: Merit;
begin
  with TVTMDosNed.Create(Application) do
    // Создание экземпляра формы.
  try    // Установка начального значения.
    for i := 1 to 7 do RadioPoints[i] :=
        (FindComponent('RadioButton' + IntToStr(i)) as TRadioButton);
    TreeView1.FullCollapse;
    ShowModal;
    // Вывод формы на экран в модальном режиме.
    if ModalResult = mrOk then
      // Если форма закрыта нажатием кнопки, подтверждающей изменения,
      Result := PlayerState;
    // возвращаем изменённое значение.
  finally
    Free;
    // Уничтожение экземпляра формы и высвобождение ресурсов.
  end;
end;

procedure MerBlock(Name: string; InpRating: array of integer;
  InpMeritType: string; InpCanBeActivated: boolean = False;
  InpDifficulty: integer = 0; InpDicepool: integer = 0);
var
  temp: TMeritBlock;
begin
  with temp do
  begin
    SetLength(Rating, Length(InpRating));
    for i := Low(InpRating) to High(InpRating) do
      Rating[i] := InpRating[i];
    MeritType := InpMeritType;
    CanBeActivated := InpCanBeActivated;
    Effect.MeritDifficultyEffect := InpDifficulty;
    Effect.MeritDicepoolEffect := InpDicepool;
  end;
  MeritData.Add(Name, temp);
end;

{$R *.lfm}

{ TVTMDosNed }

procedure DisDictionaryFill;
const
  P = 'Достоинство';
  N = 'Недостаток';
begin
  MeritData := TMeritData.Create;
  MerBlock('Обостренное чувство', [1], P, True, -2);
  MerBlock('Обоерукость', [1], P, True, 0, 0);
  MerBlock('Поглощение пищи', [1], P);
  MerBlock('Кошачье равновесие', [1], P, True, 0, -2);
  MerBlock('Сияющий здоровьем', [2], P);
  MerBlock('Чарующий голос', [2], P, True, 0, -2);
  MerBlock('Сорвиголова', [3], P, True, 3, 0);
  MerBlock('Эффективное усвоение', [3], P);
  MerBlock('Огромные размеры', [4], P);
  MerBlock('Запах могилы', [1], N, True, 0, 1);
  MerBlock('Низкий рост', [1], N);
  MerBlock('Тугоухость', [1], N, True, 0, 2);
  MerBlock('14-е поколение', [2], N);
  MerBlock('Заразный укус', [2], N);
  MerBlock('Плохое зрение', [1, 3], N, True, 0, 2);
  MerBlock('Одноглазый', [2], N, True, 0, 1);
  MerBlock('Уродство', [2], N, True, 0, 2);
  MerBlock('Ребенок', [3], N, True, 0, 2);
  MerBlock('Дефект', [3], N);
  MerBlock('Хромота', [3], N);
  MerBlock('Чудовищная внешность', [3], N);
  MerBlock('Постоянная рана', [3], N);
  MerBlock('Медленное лечение', [3], N);
  MerBlock('Пагубное пристрастие', [3], N);
  MerBlock('Немота', [4], N);
  MerBlock('Слабая кровь', [4], N);
  MerBlock('Разносчик болезней', [4], N);
  MerBlock('Глухота', [4], N, True, 0, 3);
  MerBlock('Мертвая плоть', [5], N);
  MerBlock('Слепота', [6], N, True, 0, 2);
  MerBlock('Здравый смысл', [1], P);
  MerBlock('Концентрация', [1], P);
  MerBlock('Чувство времени', [1], P);
  MerBlock('Кодекс чести', [2], P, True, 2, 0);
  MerBlock('Эйдетическая память', [2], P);
  MerBlock('Чуткий сон', [2], P);
  MerBlock('Прирожденный лингвист', [2], P, True, 3, 0);
  MerBlock('Миролюбивость', [3], P, True, 2, 0);
  MerBlock('Железная воля', [3], P, True, 3, 0);
  MerBlock('Крепкий сон', [1], N, True, 0, 2);
  MerBlock('Кошмары', [1], N, True, -1, 0);
  MerBlock('Фобия', [2], N);
  MerBlock('Разборчивость в добыче', [1], N);
  MerBlock('Робость', [1], N, True, 0, 2);
  MerBlock('Мягкосердечие', [1], N);
  MerBlock('Нарушение речи', [1], N, True, 0, 2);
  MerBlock('Вспыльчивость', [2], N, True, 0, 2);
  MerBlock('Территориальность', [2], N);
  MerBlock('Мстительность', [2], N);
  MerBlock('Амнезия', [2], N);
  MerBlock('Лунатизм', [2], N);
  MerBlock('Слабая воля', [3], N);
  MerBlock('Полное потребление', [4], N);
  MerBlock('Прославленный сир', [1], P);
  MerBlock('Прирожденный лидер', [1], P, True, 2, 0);
  MerBlock('Долг признательности', [1, 2, 3], P);
  MerBlock('Темная тайна', [1], N);
  MerBlock('Постыдный сир', [1], N);
  MerBlock('Ошибочное опознование', [1], N);
  MerBlock('Отречение сира', [1], N);
  MerBlock('Враг', [1, 2, 3, 4, 5], N);
  MerBlock('Преследование ', [4], N);
  MerBlock('На испытательном сроке', [4], N);
  MerBlock('Медиум', [2], P);
  MerBlock('Сопротивляемость магии', [2], P);
  MerBlock('Способности предсказателя', [3], P);
  MerBlock('Дух-наставник', [3], P);
  MerBlock('Иммунитет к узам', [3], P);
  MerBlock('Удачливость', [3], P);
  MerBlock('Истинная любовь', [4], P);
  MerBlock('Девять жизней', [6], P);
  MerBlock('Истинная вера', [7], P);
  MerBlock('Прикосновение холода', [1], N);
  MerBlock('Восприимчивость к чесноку', [1], N);
  MerBlock('Проклятие', [1, 2, 3, 4, 5], N);
  MerBlock('Отсутствие отражения', [1], N);
  MerBlock('Зловещее присутствие', [2], N, True, 0, 2);
  MerBlock('Восприимчивость к крестам', [3], N);
  MerBlock('Неспособность пересекать текущую воду',
    [3], N);
  MerBlock('Преследование духами', [3], N);
  MerBlock('Хватка проклятого', [4], N);
  MerBlock('Злой рок', [5], N, True, -1, 0);
  MerBlock('Чувствительность к свету', [5], N);
  MerBlock('Бледная Аура', [1], P);
  MerBlock('Иммунитет к Недостаткам Крови', [2], P);
  MerBlock('Смертельный Удар', [1], P);
  MerBlock('Кинфолк', [4, 4], P);
  MerBlock('Домитор-пария', [2], N);
  MerBlock('Сверхъестественный компаньон', [5], P);
  MerBlock('Иммунитет к Узам крови', [6], P);
  MerBlock('Модификация Изменчивостью (зрение)',
    [1], P, True, 0, -2);
  MerBlock('Модификация Изменчивостью (клыки)',
    [1], P, True, 0, -2);
  MerBlock('Модификация Изменчивостью (пищеварение)',
    [2], P, True, 0, 2);
  MerBlock('Модификация Изменчивостью (шпоры)',
    [2], P, True, 0, 2);
  MerBlock('Модификация Изменчивостью (панцирь)',
    [3], P, True, 0, 2);
  MerBlock('Модификация Изменчивостью (крылья)',
    [4], P, True, 0, -1);
  MerBlock('Истинный Цыган', [5], P);
  MerBlock('Доброжелательный Домитор', [1], P);
  MerBlock('Искусственное Старение', [2], N, True, -1, 0);
  MerBlock('Романтичные Представления', [2], N);
  MerBlock('Потеря Крови', [3], N);
  MerBlock('Чистая аура', [1], P);
  MerBlock('Низкая чувствительность', [4], P, True, 0, 3);
  MerBlock('Благотворная кровь', [1], P);
  MerBlock('Привязанность', [5], P);
  MerBlock('Бесплотный наставник', [5], P);
  MerBlock('Стигматы', [2, 3, 4], N, True, 0, 1);
  MerBlock('Заразность', [3], N);
  MerBlock('Конечности ящерицы', [1], P, True, -3, 0);
  MerBlock('Длинные пальцы', [1], P, True, 1, 0);
  MerBlock('Большие клыки', [1], P, True, 1, 0);
  MerBlock('Огромный рот', [1], P);
  MerBlock('Внушающий отвращение', [2], P);
  MerBlock('Привлекающий насекомых', [2], P);
  MerBlock('Патагия', [4], P);
  MerBlock('Пловец', [1], P, True, 0, -1);
  MerBlock('Скользкий', [2], P, True, 0, -1);
  MerBlock('Плевок блевотиной', [2], P);
  MerBlock('Невидимый сон', [2], P);
  MerBlock('Жесткая шкура', [2], P, True, 1, 0);
  MerBlock('Ложное отражение', [3], P);
  MerBlock('Дурная кровь', [3], P);
  MerBlock('Приятель-рептилия', [3], P);
  MerBlock('Плохой внешний вид', [5], P);
  MerBlock('Тупые клыки', [1], N);
  MerBlock('Изувеченная нога', [1], N);
  MerBlock('Каитифф Носферату', [1], N);
  MerBlock('Вонь', [1], N, True, -2, 0);
  MerBlock('Заражение Паразитами', [1], N);
  MerBlock('Печально известный отшельник', [1], N);
  MerBlock('Гниющий', [3], N, True, -1, 0);
  MerBlock('Утонченный вкус', [2], P);
  MerBlock('Получивший становление без чаши',
    [3], P);
  MerBlock('Привязанный к Совету', [3], N);
  MerBlock('Двойной предатель', [4], N, True, 0, 2);
  MerBlock('Неспособный к чародейству', [5], N, True, 0, 4);
  MerBlock('Совершенство', [6], P);
  MerBlock('Устойчивость к боли', [2], P);
  MerBlock('Дракон', [3], P);
  MerBlock('Близость к убежищу', [1], P, True, 1, 0);
  MerBlock('Дисциплины ревенантов', [3], P);
  MerBlock('Слабость ревенантов', [3], N);
  MerBlock('Поглощение', [5], N);
  MerBlock('Лицо в шрамах', [2, 3, 4], N, True, 0, 1);
  MerBlock('Зависимость от почвы предков', [2], N);
  MerBlock('Морское принуждение', [2], N, True, 0, 1);
  MerBlock('Управляемый ночной вид', [2], P);
  MerBlock('Морская гармония', [3], P, True, 0, -1);
  MerBlock('Чувство погоды', [1], P);
  MerBlock('Слабое отражение', [2], P);
  MerBlock('Одержимость внешним видом', [1, 2, 3, 4, 5],
    N);
  MerBlock('Неприязнь Теней', [4], N);
  MerBlock('Зов Посейдона', [1], N);
  MerBlock('Отражение смерти', [3], N);
  MerBlock('Неуправляемый ночной вид', [2], N);
  MerBlock('Сила Теней', [4], P);
  MerBlock('Устойчивость к родственным узам крови',
    [1], P);
  MerBlock('Одаренный доверием', [4], P);
  MerBlock('Шутка крови', [5], P);
  MerBlock('Жертва инцеста', [1, 2, 3, 4, 5], N);
  MerBlock('Призрачный путник', [6], N);
  MerBlock('Зависимость от магии', [3, 5], N);
  MerBlock('Несвободный', [3], N, True, 0, -1);
  MerBlock('Тонкая кровь', [4], N);
  MerBlock('Непереносимость крови', [4], N);
  MerBlock('Беззубость', [2], N);
  MerBlock('15-е поколение', [4], N);
  MerBlock('Медленное старение', [2], N);
  MerBlock('Фольклорные слабости', [0], N);
  MerBlock('Подопечный', [3], N);
  MerBlock('Дряхлость', [3], N);
  MerBlock('Клановая слабость', [2], N);
  MerBlock('Чутьё на вампиров', [2, 5], P);
  MerBlock('Хрупкие кости', [5], N);
  MerBlock('Борец', [1], P, True, 0, -1);
  MerBlock('Знакомое лицо', [1], P, True, 0, -1);
  MerBlock('Подергивание', [1], N);
  MerBlock('Постоянные клыки', [2], N);
  MerBlock('Светящиеся глаза', [3], N);
  MerBlock('Открытая рана', [2, 4], N, True, 0, 1);
  MerBlock('Умение обращаться с компьютером',
    [2], P, True, 0, -2);
  MerBlock('Развитый не по годам', [3], P);
  MerBlock('Тупой укус', [2], N);
  MerBlock('Угрызения совести', [4], N);
  MerBlock('Нетерпеливый', [1], N);
  MerBlock('Полезные знания', [1], P);
  MerBlock('Жертва Маскарада', [2], N);
  MerBlock('Холодная логика', [1], P, True, 0, -1);
  MerBlock('Столкнувшийся с Шабашем', [1], P, True, 0, -1);
  MerBlock('Посетитель Элизиумов', [1], P);
  MerBlock('Стереотип', [2], N, True, 0, 2);
  MerBlock('Старый товарищ', [2], P);
  MerBlock('Неуверенный', [1], N);
  MerBlock('Жажда невинности', [2], N);
  MerBlock('Друг подземелий', [3], P, True, 0, -1);
  MerBlock('Знаменитость', [1], P);
  MerBlock('Альтернативная личность', [3], P);
  MerBlock('Дружба примогенов', [4], P);
  MerBlock('Безобидный', [1], P);
  MerBlock('Открытая дорога', [2], P);
  MerBlock('Бывший гуль', [1], P, True, 0, -1);
  MerBlock('Изучающий врагов', [2], P);
  MerBlock('Цель вербовки', [1], N);
  MerBlock('Новое дитя', [1], N, True, 0, 1);
  MerBlock('Проваленная презентация', [1], N);
  MerBlock('Пустить в расход', [1], N);
  MerBlock('Протеже', [1], P, True, 0, -1);
  MerBlock('Восходящая звезда', [3], P, True, 0, -1);
  MerBlock('Друг шерифа', [2], P);
  MerBlock('Изучающий других', [2], P);
  MerBlock('Сиры-соперники', [2], N);
  MerBlock('Сбежавшая цель', [2], N, True, 0, 1);
  MerBlock('Использованный инструмент', [2], N);
  MerBlock('Неполное понимание', [1], N);
  MerBlock('Долг', [1, 2, 3, 4, 5, 6], P);
  MerBlock('Примоген', [7], P);
  MerBlock('Должность', [3, 4, 5], P);
  MerBlock('Разорванные узы', [4], P);
  MerBlock('Обманчивая аура', [1], P);
  MerBlock('Старое пламя', [2], N);
  MerBlock('Преследуемый как собака', [3], N);
  MerBlock('Вновь прибывший', [1], N);
  MerBlock('Забияка', [2], P);
  MerBlock('Гарпия', [5], P, True, 0, -1);
  MerBlock('Дружба клана', [4], P, True, 0, -2);
  MerBlock('Красный Список', [7], N);
  MerBlock('Маяк нечестивости', [2], N);
  MerBlock('Позор Крови', [2], N);
  MerBlock('Отвратительный регнант', [4], N);
  MerBlock('Нарушитель Маскарада', [2], N);
  MerBlock('Домен', [2, 4], P);
  MerBlock('Симпатизирующий', [1], N);
  MerBlock('Неудача', [1], N);
  MerBlock('Холодный бриз', [1], N, True, 0, 1);
  MerBlock('Зрение смерти', [2], N, False);
  MerBlock('Бывший князь', [3], N);
  MerBlock('Исцеляющее проклятие', [1], P);
  MerBlock('В постели с врагом', [3], N);
  MerBlock('Крот', [3], P);
  MerBlock('Кровавая охота', [4, 6], N);
  MerBlock('Спесивый', [2], N, True, 0, 2);
  MerBlock('Повелитель мух', [2], N, True, 0, 1);
  MerBlock('Реки крови', [3], N);
  MerBlock('Шестерка', [3], N, True, 0, 1);
  MerBlock('Безобидный для животных', [1], P);
  MerBlock('Враждебность клана', [4], N, True, 0, 2);
  MerBlock('Узы', [1], N);
  MerBlock('Посмешище', [5], N, True, 0, 2);
  MerBlock('Перебравший', [4], N);
  MerBlock('Дополнительная Дисциплина', [5], P);
  MerBlock('Скрытое диаблери', [3], P);
  MerBlock('Жаворонок', [1], P);
  MerBlock('Уязвимость от серебра', [2], N);
  MerBlock('Лентяй', [3], N, True, 0, 1);
  MerBlock('Особая ответственность', [1], N);
  MerBlock('Безгрешность', [2], P);
  MerBlock('Бесплодное вите', [5], N);
  MerBlock('Самоанализ', [1], P, True, 2);
  MerBlock('Воспоминания', [6], N);
  MerBlock('Владения', [1, 2, 3, 4, 5], P);
  MerBlock('Терпение', [3], P, True, -1);
  MerBlock('Мумия-компаньон', [5], P);
  MerBlock('Любовник', [3, 4, 5], P);
  MerBlock('Ограниченная паранойя', [2], P, True, -1);
  MerBlock('Могущественный потомок', [1, 2, 3, 4, 5], P);
  MerBlock('Верный потомок', [3], P);
  MerBlock('Просвещенный', [1, 2, 3, 4, 5, 6, 7], P, True, 0, 1);
  MerBlock('Дары Обязанности', [2, 3, 4, 5, 6], P, True, -1);
  MerBlock('Незаконный потомок', [2], N);
  MerBlock('Мстительный потомок', [2], N);
  MerBlock('Жажда смерти', [1, 2, 3, 4, 5], N);
  MerBlock('Известный диаблерист', [5], N, True, 3);
  MerBlock('Тайный диаблерист', [2], N, True, 3);
  MerBlock('Эмоциональная изоляция', [1], N, True, +1, 0);
  MerBlock('Скука', [2], N, False, 1, 0);
  MerBlock('Матереубийство/отцеубийство', [4], N);
  MerBlock('Брошенный любовник', [1, 2, 3], N);
  MerBlock('Экстремальная паранойя', [3], N);
  MerBlock('Бедность', [1], N);
  MerBlock('Долг Обязанности', [1, 2, 3, 4, 5], N);
  MerBlock('Недавно восставший', [3], N, True, 2, 0);
  MerBlock('Рутина', [2], N);
  MerBlock('Тщеславие', [1, 2, 3], N, True, 1, 0);
end;

procedure DisDictionaryFree;
begin
  MeritData.Free;
end;

function TVTMDosNed.State: Merit;//Формирование вывода
begin
  with Result do
  begin
    Name := Label2.Caption;
    Effect.MeritDifficultyEffect := SelectedMerit.Effect.MeritDifficultyEffect;
    Effect.MeritDicepoolEffect := SelectedMerit.Effect.MeritDicepoolEffect;
    if Name = 'Огромные размеры' then Effect.ExtraHealth := True
    else
      Effect.ExtraHealth := False;
    if Name = 'Сорвиголова' then Effect.DaredevilRemoveOne := True
    else
      Effect.DaredevilRemoveOne := False;
    Rating := abs(StrToInt(RadioPoints[Checked].Caption));
    if Name <> 'Кинфолк' then MeritType := SelectedMerit.MeritType
    else if label1.Caption = POS then MeritType := 'Достоинство'
    else
      MeritType := 'Недостаток';
    CanBeActivated := SelectedMerit.CanBeActivated;
  end;
end;

procedure TVTMDosNed.TreeView1Change(Sender: TObject; Node: TTreeNode);
begin
  RadioButton1.Checked := True;
  for i := 2 to 7 do RadioPoints[i].Visible := False;
  if Node.Parent = nil then
    Label2.Caption := ''
  else
  begin
    Label2.Caption := Node.Text;
    if MeritData.ContainsKey(Label2.Caption) = True then
      SelectedMerit := MeritData[Label2.Caption];
    GetMemoText(Memo1, Label2.Caption);
    if Length(SelectedMerit.Rating) > 1 then
      for i := Low(SelectedMerit.Rating) to High(SelectedMerit.Rating) do
      begin
        RadioPoints[i + 1].Caption := IntToStr(SelectedMerit.Rating[i]);
        RadioPoints[i + 1].Visible := True;
      end
    else
      RadioButton1.Caption := IntToStr(SelectedMerit.Rating[0]);
    if SelectedMerit.MeritType = 'Достоинство' then label1.Caption := POS
    else
      label1.Caption := NEG;
  end;
end;

procedure TVTMDosNed.Button1Click(Sender: TObject);
begin
  if Label2.Caption = '' then ShowMessage('Выберите свойство.')
  else
    ModalResult := mrOk;
end;

procedure TVTMDosNed.RadioButton1Click(Sender: TObject);
//Проверка для Кинфолка
begin
  if Label2.Caption = 'Кинфолк' then if RadioButton1.Checked = True then
      Label1.Caption := POS
    else
      Label1.Caption := NEG;
  Checked := (Sender as TRadioButton).tag;
end;

end.
