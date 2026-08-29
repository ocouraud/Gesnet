unit BarcodeEAN13;

interface

uses
  Graphics, SysUtils, System.Types;

// Procédure principale pour dessiner l'EAN-13 sur un Canvas
procedure DessinerEAN13(const Code12Digits: string; Canvas: TCanvas; X, Y, Hauteur: Integer);

implementation

const
  // Tables de codage pour les structures des modules (0 = espace, 1 = barre)
  TABLE_A: array[0..9] of string = ('0001101', '0011001', '0010011', '0111101', '0100011', '0110001', '0101111', '0111011', '0110111', '0001011');
  TABLE_B: array[0..9] of string = ('0100111', '0110011', '0011011', '0100001', '0011101', '0111001', '0000101', '0010001', '0001001', '0010111');
  TABLE_C: array[0..9] of string = ('1110010', '1100110', '1101100', '1000010', '1011100', '1001110', '1010000', '1000100', '1001000', '1110100');

  // Structure du premier bloc de 6 chiffres selon la valeur du 1er chiffre (0 à 9)
  STRUCTURE_A_B: array[0..9] of string = ('AAAAAA', 'AABABB', 'AABBAB', 'AABBBA', 'ABAABB', 'ABBAAB', 'ABBBAA', 'ABABAB', 'ABABBA', 'ABBABA');

function CalculerCleEAN13(const Code12: string): Char;
var
  i, Somme, Multiplicateur: Integer;
begin
  Somme := 0;
  for i := 1 to 12 do
  begin
    if (i mod 2) = 0 then Multiplicateur := 3 else Multiplicateur := 1;
    Somme := Somme + (StrToInt(Code12[i]) * Multiplicateur);
  end;
  Result := Chr(48 + ((10 - (Somme mod 10)) mod 10));
end;

procedure DessinerEAN13(const Code12Digits: string; Canvas: TCanvas; X, Y, Hauteur: Integer);
var
  FullCode: string;
  Pattern: string;
  PremierChiffre, Chiffre: Integer;
  Structure: string;
  i, j: Integer;
  CurrentX: Integer;
  EstGarde: Boolean;
begin
  // 1. Validation de l'entrée (doit contenir au moins 12 chiffres)
  if Length(Code12Digits) < 12 then Exit;

  // 2. Calcul et ajout de la clé de contrôle pour obtenir les 13 chiffres
  FullCode := Copy(Code12Digits, 1, 12);
  FullCode := FullCode + CalculerCleEAN13(FullCode);

  PremierChiffre := StrToInt(FullCode[1]);
  Structure := STRUCTURE_A_B[PremierChiffre];

  // 3. Construction de la chaîne binaire complète (95 modules au total)
  // Garde normale gauche (3 modules)
  Pattern := '101';

  // Premier bloc de 6 chiffres (2e au 7e caractère)
  for i := 2 to 7 do
  begin
    Chiffre := StrToInt(FullCode[i]);
    if Structure[i - 1] = 'A' then
      Pattern := Pattern + TABLE_A[Chiffre]
    else
      Pattern := Pattern + TABLE_B[Chiffre];
  end;

  // Garde centrale (5 modules)
  Pattern := Pattern + '01010';

  // Second bloc de 6 chiffres (8e au 13e caractère)
  for i := 8 to 13 do
  begin
    Chiffre := StrToInt(FullCode[i]);
    Pattern := Pattern + TABLE_C[Chiffre];
  end;

  // Garde normale droite (3 modules)
  Pattern := Pattern + '101';

  // 4. Dessin sur le Canvas
  CurrentX := X;
  Canvas.Pen.Color := clBlack;
  Canvas.Brush.Color := clBlack;

  for i := 1 to Length(Pattern) do
  begin
    // Les gardes descendent un peu plus bas que les barres de données (esthétique EAN)
    EstGarde := (i <= 3) or ((i >= 46) and (i <= 50)) or (i >= 93);

    if Pattern[i] = '1' then
    begin
      if EstGarde then
        Canvas.FillRect(Rect(CurrentX, Y, CurrentX + 1, Y + Hauteur + 6))
      else
        Canvas.FillRect(Rect(CurrentX, Y, CurrentX + 1, Y + Hauteur));
    end;
    Inc(CurrentX);
  end;

  // 5. Dessin du texte sous les barres
  Canvas.Brush.Style := bsClear;
  Canvas.Font.Name := 'Arial';
  Canvas.Font.Size := 8;
  Canvas.Font.Color := clBlack;

  // Premier chiffre isolé à gauche
  Canvas.TextOut(X - 8, Y + Hauteur - 2, FullCode[1]);
  // Premier bloc de 6 chiffres
  Canvas.TextOut(X + 5, Y + Hauteur + 1, Copy(FullCode, 2, 6));
  // Second bloc de 6 chiffres
  Canvas.TextOut(X + 52, Y + Hauteur + 1, Copy(FullCode, 8, 6));
end;

end.

