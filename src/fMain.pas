unit fMain;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Graphics,
  FMX.Dialogs,
  Olf.FMX.AboutDialog,
  uDMLogo,
  FMX.Menus,
  FMX.Controls.Presentation,
  FMX.StdCtrls,
  FMX.Layouts,
  FMX.Memo.Types,
  FMX.ScrollBox,
  FMX.Memo,
  System.Generics.Collections;

type
  TForm1 = class(TForm)
    OlfAboutDialog1: TOlfAboutDialog;
    MainMenu1: TMainMenu;
    mnuMacOS: TMenuItem;
    mnuFile: TMenuItem;
    mnuQuit: TMenuItem;
    mnuLanguages: TMenuItem;
    mnuHelp: TMenuItem;
    mnuAbout: TMenuItem;
    VertScrollBox1: TVertScrollBox;
    pnlGeneratedKey: TPanel;
    btnGenerateANewKey: TButton;
    mmoKey: TMemo;
    btnRefreshCode: TButton;
    pnlPascal: TPanel;
    lblPascal: TLabel;
    mmoPascal: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure mnuAboutClick(Sender: TObject);
    procedure OlfAboutDialog1URLClick(const AURL: string);
    procedure mnuQuitClick(Sender: TObject);
    procedure btnGenerateANewKeyClick(Sender: TObject);
    procedure btnRefreshCodeClick(Sender: TObject);
    procedure mmoSelectAllOnEnter(Sender: TObject);
  private
    { Déclarations privées }
  protected
    procedure InitMainFormCaption;
    procedure InitAboutDialogBox;
    procedure FillPascalCode(const Key: TList<byte>);
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

uses
  u_urlOpen;

procedure TForm1.btnGenerateANewKeyClick(Sender: TObject);
var
  i: byte;
  List, Keys: TList<byte>;
  idx: byte;
  s: string;
begin
  randomize;
  List := TList<byte>.Create;
  try
    for i := 0 to 255 do
      List.add(i);
    Keys := TList<byte>.Create;
    try
      for i := 0 to 255 do
      begin
        idx := random(List.count);
        Keys.add(List[idx]);
        List.Delete(idx);
      end;
      s := '';
      for i := 0 to 255 do
        if (i > 0) then
          s := s + ', ' + Keys[i].tostring
        else
          s := Keys[i].tostring;
      mmoKey.Text := s;
    finally
      Keys.free;
    end;
  finally
    List.free;
  end;

  btnRefreshCodeClick(btnRefreshCode);
end;

procedure TForm1.btnRefreshCodeClick(Sender: TObject);
var
  i: integer;
  Key: TList<byte>;
  tab: tstringdynarray;
  NbAvailable: TList<boolean>;
  nb: integer;
begin
  tab := mmoKey.Text.replace(' ', '').Split([',']);
  if length(tab) <> 256 then
    raise Exception.Create('Wrong number of bytes in the list. (' + length(tab)
      .tostring + ')');

  NbAvailable := TList<boolean>.Create;
  try
    for i := 0 to 255 do
      NbAvailable.add(true);

    Key := TList<byte>.Create;
    try
      for i := 0 to length(tab) - 1 do
        if tab[i].trim.IsEmpty then
          raise Exception.Create('An empty value is in the list.')
        else
        begin
          nb := tab[i].trim.ToInteger;
          if (nb >= 0) and (nb < 256) and NbAvailable[nb] then
          begin
            Key.add(nb);
            NbAvailable[nb] := false;
          end
          else
            raise Exception.Create('Wrong or already used value ' +
              nb.tostring + '.');
        end;

      FillPascalCode(Key);
    finally
      Key.free;
    end;
  finally
    NbAvailable.free;
  end;
end;

procedure TForm1.FillPascalCode(const Key: TList<byte>);
var
  i: integer;
  s: string;
begin
  mmoPascal.Lines.Clear;
  mmoPascal.Lines.add('var Key:array of byte;');
  s := 'Key := [';
  for i := 0 to Key.count - 1 do
    if i > 0 then
      s := s + ', ' + Key[i].tostring
    else
      s := s + Key[i].tostring;
  s := s + '];';
  mmoPascal.Lines.add(s);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  InitMainFormCaption;
  InitAboutDialogBox;

  // Menu
{$IF Defined(MACOS) and not Defined(IOS)}
  mnuAbout.Parent := mnuMacOS;
  mnuQuit.Visible := false;
{$ENDIF}
  mnuMacOS.Visible := (mnuMacOS.ItemsCount > 0);
  mnuHelp.Visible := (mnuHelp.ItemsCount > 0);
end;

procedure TForm1.InitAboutDialogBox;
begin
  // TODO : traduire texte(s)
  OlfAboutDialog1.Licence.Text :=
    'This program is distributed as shareware. If you use it (especially for ' +
    'commercial or income-generating purposes), please remember the author and '
    + 'contribute to its development by purchasing a license.' + slinebreak +
    slinebreak +
    'This software is supplied as is, with or without bugs. No warranty is offered '
    + 'as to its operation or the data processed. Make backups!';
  OlfAboutDialog1.Description.Text :=
    'Swap keys Generator creates a randomly generated serie of bytes as an array depending on the language you use.'
    + slinebreak + slinebreak + '*****************' + slinebreak +
    '* Publisher info' + slinebreak + slinebreak +
    'This application was developed by Patrick Prémartin.' + slinebreak +
    slinebreak +
    'It is published by OLF SOFTWARE, a company registered in Paris (France) under the reference 439521725.'
    + slinebreak + slinebreak + '****************' + slinebreak +
    '* Personal data' + slinebreak + slinebreak +
    'This program is autonomous in its current version. It does not depend on the Internet and communicates nothing to the outside world.'
    + slinebreak + slinebreak + 'We have no knowledge of what you do with it.' +
    slinebreak + slinebreak +
    'No information about you is transmitted to us or to any third party.' +
    slinebreak + slinebreak +
    'We use no cookies, no tracking, no stats on your use of the application.' +
    slinebreak + slinebreak + '**********************' + slinebreak +
    '* User support' + slinebreak + slinebreak +
    'If you have any questions or require additional functionality, please leave us a message on the application''s website or on its code repository.'
    + slinebreak + slinebreak +
    'To find out more, visit https://swapkeysgenerator.olfsoftware.fr';
end;

procedure TForm1.InitMainFormCaption;
begin
{$IFDEF DEBUG}
  caption := '[DEBUG] ';
{$ELSE}
  caption := '';
{$ENDIF}
  caption := caption + OlfAboutDialog1.Titre + ' v' +
    OlfAboutDialog1.VersionNumero;
end;

procedure TForm1.mmoSelectAllOnEnter(Sender: TObject);
begin
  // TODO : add a QP issue because the SelectAll don't select all lines (problem of string size)
  if Sender is TMemo then
    (Sender as TMemo).SelectAll;
end;

procedure TForm1.mnuAboutClick(Sender: TObject);
begin
  OlfAboutDialog1.Execute;
end;

procedure TForm1.mnuQuitClick(Sender: TObject);
begin
  Close;
end;

procedure TForm1.OlfAboutDialog1URLClick(const AURL: string);
begin
  url_Open_In_Browser(AURL);
end;

initialization

{$IFDEF DEBUG}
  ReportMemoryLeaksOnShutdown := true;
{$ENDIF}

end.
