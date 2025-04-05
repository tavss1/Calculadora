unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Styles, Vcl.Themes;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    txtNum1: TEdit;
    Label2: TLabel;
    txtNum2: TEdit;
    btnSomar: TButton;
    btnSubt: TButton;
    btnMultp: TButton;
    btnDividir: TButton;
    Label3: TLabel;
    txtNumResultado: TEdit;
    btnLimpar: TButton;
    opcVisual: TRadioGroup;
    procedure btnLimparClick(Sender: TObject);
    procedure btnDividirClick(Sender: TObject);
    procedure btnMultpClick(Sender: TObject);
    procedure btnSomarClick(Sender: TObject);
    procedure btnSubtClick(Sender: TObject);
    procedure opcVisualClick(Sender: TObject);
    procedure txtNum1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    function validarCampos (): Boolean;
    procedure habilitarBotoes (habilitado: Boolean);
    procedure registrarLog (acao: String);
    function calcularResult (num1, num2: Real; operacao: String):Real;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnDividirClick(Sender: TObject);
begin
  if validarCampos then
    begin
      if txtNum2.Text = '0' then
        begin
          ShowMessage('Impossível dividir por 0. Tente outro número!');
          registrarLog('Erro de divisão por 0');
        end
      else
        begin
          txtNumResultado.Text:= FloatToStr(calcularResult(StrToFloat(txtnum1.Text), StrToFloat(txtNum2.Text), 'dividir'));
          registrarLog('Divisão, num1='+txtNum1.Text+', num2='+txtNum2.Text+', resultado='+txtNumResultado.Text);
        end;
    end;
end;

procedure TForm1.btnLimparClick(Sender: TObject);
begin
  txtNum1.Text := '';
  txtNum2.Text := '';
  txtNumResultado.Text := '';
  registrarLog('Campos limpos com sucesso.');
end;

procedure TForm1.btnMultpClick(Sender: TObject);
begin
  if validarCampos then
    begin
      txtNumResultado.Text:= FloatToStr(calcularResult(StrToFloat(txtnum1.Text), StrToFloat(txtNum2.Text), 'multiplicar'));
      registrarLog('Multiplicação, num1='+txtNum1.Text+', num2='+txtNum2.Text+', resultado='+txtNumResultado.Text);
    end;
end;

procedure TForm1.btnSomarClick(Sender: TObject);
begin
  if validarCampos then
    begin
      txtNumResultado.Text:= FloatToStr(calcularResult(StrToFloat(txtnum1.Text), StrToFloat(txtNum2.Text), 'somar'));
      registrarLog('Soma, num1='+txtNum1.Text+', num2='+txtNum2.Text+', resultado='+txtNumResultado.Text);
    end;
end;

procedure TForm1.btnSubtClick(Sender: TObject);
begin
  if validarCampos then
    begin
      txtNumResultado.Text:= FloatToStr(calcularResult(StrToFloat(txtnum1.Text), StrToFloat(txtNum2.Text), 'subtrair'));
      registrarLog('Subtração, num1='+txtNum1.Text+', num2='+txtNum2.Text+', resultado='+txtNumResultado.Text);
    end;
end;

function TForm1.calcularResult(num1, num2: Real; operacao: String): Real;
var 
  resultado: Real;
begin
  resultado:= 0;
  if operacao = 'somar' then
    resultado:= num1+num2;
  if operacao = 'subtrair' then
    resultado:= num1-num2;
  if operacao = 'dividir' then
    resultado:= num1/num2;
  if operacao = 'multiplicar' then
    resultado:= num1*num2;
  
  Result:= resultado;

end;


procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  registrarLog('Aplicação Encerrada');
  registrarLog('-------------------------');
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  registrarLog('-------------------------');
  registrarLog('Aplicação Iniciada');
end;

procedure TForm1.habilitarBotoes(habilitado: Boolean);
begin
  btnSomar.Enabled:=habilitado; 
  btnSubt.Enabled:=habilitado;
  btnDividir.Enabled:=habilitado;
  btnMultp.Enabled:=habilitado;
end;

procedure TForm1.opcVisualClick(Sender: TObject);
begin

   case opcVisual.ItemIndex of
    0: TStyleManager.SetStyle('Windows');
    1: TStyleManager.SetStyle('Glow');
    2: TStyleManager.SetStyle('Aqua Light Slate');
   end;

end;

procedure TForm1.registrarLog(acao: String);
var
  arquivo: TextFile;
begin

  try
    AssignFile(arquivo, 'Logs.txt');

    if FileExists('Logs.txt') then
      Append(arquivo)
    else
      Rewrite(arquivo);

    WriteLn (arquivo, '[' + DateTimeToStr(now())+'] - ' + acao);
      
  finally
    CloseFile(arquivo);
  end;
  
end;

procedure TForm1.txtNum1Change(Sender: TObject);
begin
  if validarCampos then
    habilitarBotoes(True)
  else
    habilitarBotoes(False);
end;

function TForm1.validarCampos: Boolean;
begin
  if (txtNum1.Text = '') or (txtNum2.Text= '') then
    Result:= False
  else
    try
      StrToFloat(txtNum1.Text);
      StrToFloat(txtNum2.Text);

      Result:= True;
    except
       on E: EConvertError do
       begin
         Result:= False;
       end;
    end;
end;

end.
