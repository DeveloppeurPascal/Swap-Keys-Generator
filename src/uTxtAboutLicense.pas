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
  File last update : 2025-05-26T19:25:08.000+02:00
  Signature : 036cb84a218fa61cc116bb447632182ac26880d2
  ***************************************************************************
*)

unit uTxtAboutLicense;

interface

function GetTxtAboutLicense(const Language: string;
  const Recursif: boolean = false): string;

implementation

// For the languages codes, please use 2 letters ISO codes
// https://en.wikipedia.org/wiki/List_of_ISO_3166_country_codes

uses
  System.SysUtils,
  uConsts;

const
  CTxtEN = '''
This program is distributed as shareware. If you use it (especially for commercial or income-generating purposes), please remember the author and contribute to its development by purchasing a license.

This software is supplied as is, with or without bugs. No warranty is offered as to its operation or the data processed. Make backups!

''';
  CTxtFR = '''
Ce programme est distribué en tant que shareware. Si vous l'utilisez (en particulier à des fins commerciales ou rémunératrices), merci de vous souvenir de l'auteur et de contribuer à son développement en achetant une licence.

Ce logiciel est fourni tel quel, avec ou sans bogues. Aucune garantie n'est offerte quant à son fonctionnement ou aux données traitées. Faites des sauvegardes !

''';

function GetTxtAboutLicense(const Language: string;
  const Recursif: boolean): string;
var
  lng: string;
begin
  lng := Language.tolower;
  if (lng = 'en') then
    result := CTxtEN
  else if (lng = 'fr') then // France
    result := CTxtFR
  else if not Recursif then
    result := GetTxtAboutLicense(CDefaultLanguage, true)
  else
    raise Exception.Create('Unknow license for language "' + Language + '".');
end;

end.
