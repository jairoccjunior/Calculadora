unit UnitCalculadora;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TFrmCalculadora = class(TForm)
    EdResultado: TEdit;
    Bt7: TButton;
    Bt8: TButton;
    Bt9: TButton;
    BtSomar: TButton;
    Bt4: TButton;
    Bt5: TButton;
    Bt6: TButton;
    BtSubitrair: TButton;
    Bt1: TButton;
    Bt2: TButton;
    Bt3: TButton;
    BtMultiplicar: TButton;
    BtLimpar: TButton;
    Bt0: TButton;
    Btigual: TButton;
    BtDividir: TButton;
    procedure BtSomarClick(Sender: TObject);
    procedure BtSubitrairClick(Sender: TObject);
    procedure BtMultiplicarClick(Sender: TObject);
    procedure BtDividirClick(Sender: TObject);
    procedure NumeroClick(Sender: TObject);
    procedure BtigualClick(Sender: TObject);
    procedure BtLimparClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    { FOperacao : String; }
     FOperacao : Char;
     FTotal : Double;
     FUltimoNumero : Double;

     procedure Calcular;
     procedure Limpar;


  public
    { Public declarations }
  end;

var
  FrmCalculadora: TFrmCalculadora;

implementation

{$R *.dfm}


procedure TFrmCalculadora.NumeroClick(Sender: TObject);
begin
if FUltimoNumero = 0 then
  EdResultado.Text := TButton(Sender).Caption
else
  EdResultado.Text := EdResultado.Text + TButton(Sender).Caption;
  FUltimoNumero := StrToFloat(EdResultado.Text);
end;

procedure TFrmCalculadora.BtDividirClick(Sender: TObject);
begin
FUltimoNumero := StrToFloat(EdResultado.Text);
Calcular;
FOperacao := '/';
end;

procedure TFrmCalculadora.BtigualClick(Sender: TObject);
begin
Calcular;
end;

procedure TFrmCalculadora.BtLimparClick(Sender: TObject);
begin
Limpar;
end;

procedure TFrmCalculadora.BtMultiplicarClick(Sender: TObject);
begin
FUltimoNumero := StrToFloat(EdResultado.Text);
     Calcular;
     FOperacao := '*';
end;

procedure TFrmCalculadora.BtSomarClick(Sender: TObject);
begin
FUltimoNumero := StrToFloat(EdResultado.Text);
      Calcular;
      FOperacao := '+';
end;

procedure TFrmCalculadora.BtSubitrairClick(Sender: TObject);
begin
FUltimoNumero := StrToFloat(EdResultado.Text);
           Calcular;
           FOperacao := '-';
end;

procedure TFrmCalculadora.Calcular;
begin
case FOperacao of
  '+' : FTotal := FTotal + StrToFloat(EdResultado.Text);
  '-' : FTotal := FTotal - StrToFloat(EdResultado.Text);
  '*' : FTotal := FTotal * StrToFloat(EdResultado.Text);
  '/' : FTotal := FTotal / StrToFloat(EdResultado.Text);
end;
EdResultado.Text := FloatToStr(FTotal);
FUltimoNumero := 0;
end;

procedure TFrmCalculadora.FormCreate(Sender: TObject);
begin
Limpar;
end;

procedure TFrmCalculadora.Limpar;
begin
FUltimoNumero := 0;
EdResultado.Text := '0';
FOperacao := '+';
FTotal := 0;

end;

end.
