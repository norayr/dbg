MODULE dbg;
IMPORT Out;

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

PROCEDURE enter*(name: ARRAY OF CHAR);
BEGIN
  Out.String(entr); Out.String(name); Out.Ln
END enter;

PROCEDURE setDebug*(state: BOOLEAN);
BEGIN
  debug := state
END setDebug;

BEGIN
  debug := FALSE;
END dbg.
