/// <summary>
/// ***************************************************************************
///
/// Swap Keys Generator
///
/// Copyright 2024 Patrick Pr�martin under AGPL 3.0 license.
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
/// File last update : 2024-08-05T21:27:30.714+02:00
/// Signature : fb9a7b3ee752f3e7e45c0ade04ac7ceac7af3f3f
/// ***************************************************************************
/// </summary>

unit uDMLogo;

interface

uses
  System.SysUtils, System.Classes, System.ImageList, FMX.ImgList;

type
  TdmLogo = class(TDataModule)
    imgLogo: TImageList;
  private
    { D�clarations priv�es }
  public
    { D�clarations publiques }
  end;

var
  dmLogo: TdmLogo;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

end.
