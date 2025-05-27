(* C2PP
  ***************************************************************************

  XOR Keys Generator

  Copyright 2024-2025 Patrick Prémartin under AGPL 3.0 license.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
  THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
  DEALINGS IN THE SOFTWARE.

  ***************************************************************************

  A simple generator of random series of bytes that can be used, for
  example, to encrypt or sign data.

  If you're developing under Delphi or Pascal in general, you can use these blocks with the TOlfCryptDecrypt.XORCrypt and TOlfCryptDecrypt.XORDecrypt functions in the Olf.RTL.CryptDecrypt unit from https://github.com/DeveloppeurPascal/librairies/

  ***************************************************************************

  Author(s) :
  Patrick PREMARTIN

  Site :
  https://xorkeysgenerator.olfsoftware.fr/

  Project site :
  https://github.com/DeveloppeurPascal/XOR-Keys-Generator

  ***************************************************************************
  File last update : 2025-05-26T19:18:46.000+02:00
  Signature : 5f494f11df4cfe19f5f9270e6d222385829420c6
  ***************************************************************************
*)

unit uConfigHelpers;

interface

uses
  uConfig;

type
  TConfigHelpers = class helper for tconfig
  private
  private
    function GetIsChecked(Language: String): boolean;
    procedure SetIsChecked(Language: String; const Value: boolean);
  public
    property IsChecked[Language: String]: boolean read GetIsChecked
      write SetIsChecked;
  end;

implementation

{ TConfigHelpers }

function TConfigHelpers.GetIsChecked(Language: String): boolean;
begin
  result := GetParams.GetValue('Language.' + Language, True);
end;

procedure TConfigHelpers.SetIsChecked(Language: String; const Value: boolean);
begin
  GetParams.SetValue('Language.' + Language, Value);
  Save;
end;

end.
