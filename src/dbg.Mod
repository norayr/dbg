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
  wrn   = "⚠ ";
  print = "🖨";

VAR
  debug: BOOLEAN;

(* messages *)

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


(* print vairables*)

PROCEDURE prnStr*(name: ARRAY OF CHAR; str: ARRAY OF CHAR);
BEGIN
  Out.String(print);
  Out.String("variable "); Out.String(name); Out.String ("='");
  Out.String(str); Out.Char("'");
  Out.Ln
END prnStr;

PROCEDURE prnInt*(name: ARRAY OF CHAR; int: LONGINT);
BEGIN
  Out.String(print);
  Out.String("variable "); Out.String(name); Out.String ("='");
  Out.Int(int, 0); Out.Char("'");
  Out.Ln
END prnInt;

PROCEDURE prnBool*(name: ARRAY OF CHAR; b: BOOLEAN);
BEGIN
  Out.String(print);
  Out.String("variable "); Out.String(name); Out.String ("='");
  IF b THEN Out.String("TRUE") ELSE Out.String("FALSE"); Out.Char("'");
    Out.Ln
  END
END prnBool;

PROCEDURE prnPstrings*(VAR name: ARRAY OF CHAR; VAR pstrs: strTypes.pstrings);
VAR
  i: INTEGER;
BEGIN
  Out.String(print);
  IF pstrs # NIL THEN
    i := 0;
    Out.String("------------------------------"); Out.Ln;
    REPEAT
      Out.String(name); Out.Char("["); Out.Int(i, 0); Out.String("]='");
      Out.String(pstrs^[i]^); Out.String("'"); Out.Ln;
    UNTIL i = LEN(pstrs^);
    Out.String("------------------------------"); Out.Ln;
  ELSE
    Out.String(wrn); Out.String(name); Out.String(" is NIL"); Out.Ln
  END
END prnPstrings;


(* structure *)

PROCEDURE enter*(name: ARRAY OF CHAR);
BEGIN
  Out.String(entr); Out.String(name); Out.String("()"); Out.Ln
END enter;

PROCEDURE enterLoop*(msg: ARRAY OF CHAR);
BEGIN
  Out.String(loop); Out.String(msg); Out.Ln
END enterLoop;

PROCEDURE exitLoop*(msg: ARRAY OF CHAR);
BEGIN
  Out.String(exit); Out.String(msg); Out.Ln
END exitLoop;

PROCEDURE compStrs*(strs0, strs1: ARRAY OF CHAR);
BEGIN
  Out.String(qst);
  Out.String("comparing '");
  Out.String(strs0); Out.String("' with '"); Out.String(strs1); Out.Char("'");
  Out.Ln
END compStrs;

(* set debug on or off *)

PROCEDURE setDebug*(state: BOOLEAN);
BEGIN
  debug := state
END setDebug;

BEGIN
  debug := FALSE;
END dbg.
