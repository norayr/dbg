MODULE dbg;
IMPORT Out, strTypes, strUtils;

CONST
  qst* = "՞ ";
  ntl* = "… ";
  ehh* = "";
  not* = "¬ ";
  yay* = "✓ ";

  entr  = "⎆ " ;
  exit  = "⎘ ";
  over  = "⁂ " ;
  loop  = "➰";
  true  = "⊨ ";
  nzr   = "🧿";
  print = "🖨";

VAR
  debug: BOOLEAN;

PROCEDURE msg*(VAR msg: ARRAY OF CHAR);
BEGIN
  Out.String(ntl); Out.String(msg); Out.Ln;
END msg;

PROCEDURE notmsg*(VAR msg: ARRAY OF CHAR);
BEGIN
  Out.String(not); Out.String(msg); Out.Ln
END notmsg;

PROCEDURE yaymsg*(VAR msg: ARRAY OF CHAR);
BEGIN
  Out.String(yay); Out.String(msg); Out.Ln;
END yaymsg;

PROCEDURE prnStr*(name: ARRAY OF CHAR; str: ARRAY OF CHAR);
BEGIN
  Out.String("variable "); Out.String(name); Out.String ("='");
  Out.String(str); Out.Char("'");
  Out.Ln
END prnStr;

PROCEDURE prnInt*(name: ARRAY OF CHAR; int: LONGINT);
BEGIN
  Out.String("variable "); Out.String(name); Out.String ("='");
  Out.Int(int, 0); Out.Char("'");
  Out.Ln
END prnInt;

PROCEDURE prnBool*(name: ARRAY OF CHAR; b: BOOLEAN);
BEGIN
  Out.String("variable "); Out.String(name); Out.String ("='");
  IF b THEN Out.String("TRUE") ELSE Out.String("FALSE"); Out.Char("'");
  Out.Ln
END prnBool;

PROCEDURE prnPstrings(VAR name: ARRAY OF CHAR; VAR pstrs: strTypes.pstrings);
VAR
  i: INTEGER;
BEGIN
i := 0;
  Out.String("------------------------------"); Out.Ln;
  REPEAT
    Out.String(name); Out.Char("["); Out.Int(i, 0); Out.String("]='");
    Out.String(pstrs^[i]^); Out.String("'"); Out.Ln;
  UNTIL i = LEN(pstrs^);
  Out.String("------------------------------"); Out.Ln;
END prnPstrings;

PROCEDURE enter*(name: ARRAY OF CHAR);
BEGIN
  Out.String(entr); Out.String(name); Out.String("()"); Out.Ln
END enter;

PROCEDURE setDebug*(state: BOOLEAN);
BEGIN
  debug := state
END setDebug;

BEGIN
  debug := FALSE;
END dbg.
