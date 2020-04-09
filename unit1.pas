unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  Menus;

type

  { TForm1 }

  TForm1 = class(TForm){это класс формы} {для класса form объектом будет TForm1}
    HELPMENU: TMenuItem;
    Vvod:TEdit;
    go: TButton;
    Image1: TImage;
    MainMenu1: TMainMenu;
    FILEINSTYMENT: TMenuItem;
    CLOSEF: TMenuItem;
    OPENF: TMenuItem;
    SAVEF: TMenuItem;
    SAVEFAS: TMenuItem;
    OpenDialog1: TOpenDialog;
    Podskazka2: TLabel;
    Results: TMemo;
    SaveDialog1: TSaveDialog;
    Podskazka: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure goClick(Sender: TObject);
    procedure CLOSEFClick(Sender: TObject);
    procedure HELPMENUClick(Sender: TObject);
    procedure OPENFClick(Sender: TObject);
    procedure SAVEFASClick(Sender: TObject);
    procedure SAVEFClick(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
    Results.Lines.Clear;
    Vvod.Text:=FloatToStr(1);
end;

procedure TForm1.goClick(Sender: TObject);
   var A,V,S: real;
begin
  if TryStrToFloat(Vvod.Text, A) = false then
  ShowMessage('Неправильно введён параметр')
  else
 begin
 A:=StrToFloat(Vvod.Text);
 V:=A*A*A;
 S:=A*A*6;
 Results.Lines.Add('Объём куба со стороной '+ FloatToStr(A) +' равен '+ FloatToStr (V));
 Results.Lines.Add('Площадь боковой поверхности куба стороной '+ FloatToStr(A) + ' равна '+ FloatToStr(S));
 end;

end;

procedure TForm1.CLOSEFClick(Sender: TObject);
begin
   CLOSE;
end;

procedure TForm1.HELPMENUClick(Sender: TObject);
begin
  ShowMessage('Программа вычисляет площадь и объем куба.Автор: Бурдуковский Давид ');
end;

procedure TForm1.OPENFClick(Sender: TObject);
 var FName,s: string;
f:text;
begin
if OpenDialog1.Execute then
begin
FName := OpenDialog1.FileName;
if FName <> '' then begin
AssignFile(f,FName);
Reset(f);
read(f,s);
Vvod.Text:=s;
closeFile(f);
 end;
end;
enD;

procedure TForm1.SAVEFASClick(Sender: TObject);
begin
Results.Lines.SaveToFile( 'результаты.txt' );
end;

procedure TForm1.SAVEFClick(Sender: TObject);
 var FName,s: string;
 f:text;
 begin
 if SaveDialog1.Execute then
 begin
 FName := SaveDialog1.FileName;
 if FName <> '' then begin
 AssignFile(f,FName);
 Append(f);
 s:=Vvod.Text;
 writeln(f,s);
 closeFile(f);
 end;
 end;
 end;




end.

