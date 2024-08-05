/// <summary>
/// ***************************************************************************
///
/// Swap Keys Generator
///
/// Copyright 2024 Patrick Prémartin under AGPL 3.0 license.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
/// THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
/// FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
/// DEALINGS IN THE SOFTWARE.
///
/// ***************************************************************************
///
/// Generator of reversible 256-byte blocks for encrypting data by exchanging
/// values. Each byte in the final set is represented only once.
///
/// If you're developing under Delphi or Pascal in general, you can use these blocks with the TOlfCryptDecrypt.SwapCrypt and TOlfCryptDecrypt.SwapDecrypt functions in the Olf.RTL.CryptDecrypt unit from https://github.com/DeveloppeurPascal/librairies/
///
/// ***************************************************************************
///
/// Author(s) :
/// Patrick PREMARTIN
///
/// Site :
/// https://swapkeysgenerator.olfsoftware.fr/
///
/// Project site :
/// https://github.com/DeveloppeurPascal/Swap-Keys-Generator
///
/// ***************************************************************************
/// File last update : 2024-08-05T21:27:30.654+02:00
/// Signature : 3ee2ffcf2375cf35e18575f7377d7008091195fc
/// ***************************************************************************
/// </summary>

program SwapKeysGenerator;

uses
  System.StartUpCopy,
  FMX.Forms,
  fMain in 'fMain.pas' {frmMain},
  uDMLogo in 'uDMLogo.pas' {dmLogo: TDataModule},
  Olf.RTL.Params in '..\lib-externes\librairies\src\Olf.RTL.Params.pas',
  u_urlOpen in '..\lib-externes\librairies\src\u_urlOpen.pas',
  Olf.RTL.CryptDecrypt in '..\lib-externes\librairies\src\Olf.RTL.CryptDecrypt.pas',
  Olf.FMX.AboutDialog in '..\lib-externes\AboutDialog-Delphi-Component\src\Olf.FMX.AboutDialog.pas',
  Olf.FMX.AboutDialogForm in '..\lib-externes\AboutDialog-Delphi-Component\src\Olf.FMX.AboutDialogForm.pas' {OlfAboutDialogForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TdmLogo, dmLogo);
  Application.Run;
end.
